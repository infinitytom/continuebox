package main

import (
	"errors"
	"image"
	"runtime"
	"unsafe"

	"github.com/ebitengine/purego"
)

type rectangle struct{ x, y, w, h int32 }
type color struct{ r, g, b, a uint8 }

type screen struct {
	sdl, ttf, window, renderer, font, heading           uintptr
	pads                                                []uintptr
	quit, fontQuit                                      func()
	destroyWindow, destroyRenderer, closeFont, closePad func(uintptr)
	setColor                                            func(uintptr, uint8, uint8, uint8, uint8) int32
	clear                                               func(uintptr) int32
	fill                                                func(uintptr, *rectangle) int32
	present                                             func(uintptr)
	paintText                                           func(uintptr, string, uint32) uintptr
	freeSurface, destroyTexture                         func(uintptr)
	createTexture                                       func(uintptr, uintptr) uintptr
	createRawTexture                                    func(uintptr, uint32, int32, int32, int32) uintptr
	updateTexture                                       func(uintptr, *rectangle, unsafe.Pointer, int32) int32
	queryTexture                                        func(uintptr, uintptr, uintptr, *int32, *int32) int32
	copyTexture                                         func(uintptr, uintptr, *rectangle, *rectangle) int32
	wait                                                func(unsafe.Pointer, int32) int32
}

func newScreen() (s *screen, err error) {
	runtime.LockOSThread()
	s = &screen{}
	display := s
	defer func() {
		if problem := recover(); problem != nil {
			err = errors.New("当前系统缺少所需的 SDL2 接口")
		}
		if err != nil {
			display.close()
		}
	}()
	if s.sdl, err = purego.Dlopen("libSDL2-2.0.so.0", purego.RTLD_NOW|purego.RTLD_GLOBAL); err != nil {
		return nil, err
	}
	if s.ttf, err = purego.Dlopen("libSDL2_ttf-2.0.so.0", purego.RTLD_NOW|purego.RTLD_GLOBAL); err != nil {
		return nil, err
	}
	var initSDL func(uint32) int32
	var initTTF func() int32
	var createWindow func(string, int32, int32, int32, int32, uint32) uintptr
	var createRenderer func(uintptr, int32, uint32) uintptr
	var logicalSize func(uintptr, int32, int32) int32
	var openFont func(string, int32) uintptr
	var countPads func() int32
	var openPad func(int32) uintptr
	for name, fn := range map[string]any{
		"SDL_Init": &initSDL, "SDL_Quit": &s.quit, "SDL_CreateWindow": &createWindow,
		"SDL_DestroyWindow": &s.destroyWindow, "SDL_CreateRenderer": &createRenderer,
		"SDL_DestroyRenderer": &s.destroyRenderer, "SDL_RenderSetLogicalSize": &logicalSize,
		"SDL_SetRenderDrawColor": &s.setColor, "SDL_RenderClear": &s.clear,
		"SDL_RenderFillRect": &s.fill, "SDL_RenderPresent": &s.present,
		"SDL_FreeSurface": &s.freeSurface, "SDL_CreateTextureFromSurface": &s.createTexture,
		"SDL_CreateTexture": &s.createRawTexture, "SDL_UpdateTexture": &s.updateTexture,
		"SDL_QueryTexture": &s.queryTexture, "SDL_RenderCopy": &s.copyTexture,
		"SDL_DestroyTexture": &s.destroyTexture, "SDL_WaitEventTimeout": &s.wait,
		"SDL_NumJoysticks": &countPads, "SDL_GameControllerOpen": &openPad,
		"SDL_GameControllerClose": &s.closePad,
	} {
		purego.RegisterLibFunc(fn, s.sdl, name)
	}
	for name, fn := range map[string]any{
		"TTF_Init": &initTTF, "TTF_Quit": &s.fontQuit, "TTF_OpenFont": &openFont,
		"TTF_CloseFont": &s.closeFont, "TTF_RenderUTF8_Blended": &s.paintText,
	} {
		purego.RegisterLibFunc(fn, s.ttf, name)
	}
	if initSDL(0x2020) != 0 || initTTF() != 0 {
		return s, errors.New("SDL2 视频或字体初始化失败")
	}
	s.window = createWindow("ContinueBox", 0, 0, 720, 480, 0x1001)
	if s.window == 0 {
		return s, errors.New("创建掌机窗口失败")
	}
	s.renderer = createRenderer(s.window, -1, 0)
	if s.renderer == 0 || logicalSize(s.renderer, 720, 480) != 0 {
		return s, errors.New("创建 SDL2 渲染器失败")
	}
	s.font = openFont("NotoSansSC.ttf", 22)
	s.heading = openFont("NotoSansSC.ttf", 32)
	if s.font == 0 || s.heading == 0 {
		return s, errors.New("无法加载续映中文字体")
	}
	for index := int32(0); index < countPads(); index++ {
		if pad := openPad(index); pad != 0 {
			s.pads = append(s.pads, pad)
		}
	}
	return s, nil
}

func (s *screen) picture(img *image.RGBA, x, y int32) {
	if img == nil || len(img.Pix) == 0 {
		return
	}
	width, height := int32(img.Rect.Dx()), int32(img.Rect.Dy())
	// SDL_PIXELFORMAT_RGBA32 is ABGR8888 on the little-endian H700.
	texture := s.createRawTexture(s.renderer, 0x16762004, 0, width, height)
	if texture == 0 {
		return
	}
	defer s.destroyTexture(texture)
	if s.updateTexture(texture, nil, unsafe.Pointer(&img.Pix[0]), int32(img.Stride)) == 0 {
		s.copyTexture(s.renderer, texture, nil, &rectangle{x, y, width, height})
	}
	runtime.KeepAlive(img)
}

func (s *screen) close() {
	for _, pad := range s.pads {
		s.closePad(pad)
	}
	for _, font := range []uintptr{s.font, s.heading} {
		if font != 0 {
			s.closeFont(font)
		}
	}
	if s.renderer != 0 {
		s.destroyRenderer(s.renderer)
	}
	if s.window != 0 {
		s.destroyWindow(s.window)
	}
	if s.fontQuit != nil {
		s.fontQuit()
	}
	if s.quit != nil {
		s.quit()
	}
	if s.ttf != 0 {
		_ = purego.Dlclose(s.ttf)
	}
	if s.sdl != 0 {
		_ = purego.Dlclose(s.sdl)
	}
	runtime.UnlockOSThread()
}

func (s *screen) box(c color, x, y, w, h int32) {
	s.setColor(s.renderer, c.r, c.g, c.b, c.a)
	s.fill(s.renderer, &rectangle{x, y, w, h})
}

func (s *screen) text(font uintptr, c color, x, y, maxWidth int32, value string) {
	if value == "" {
		return
	}
	characters := []rune(value)
	if len(characters) > 60 {
		characters = characters[:59]
		characters = append(characters, '…')
	}
	rgba := uint32(c.r) | uint32(c.g)<<8 | uint32(c.b)<<16 | uint32(c.a)<<24
	surface := s.paintText(font, string(characters), rgba)
	if surface == 0 {
		return
	}
	texture := s.createTexture(s.renderer, surface)
	s.freeSurface(surface)
	if texture == 0 {
		return
	}
	defer s.destroyTexture(texture)
	var width, height int32
	s.queryTexture(texture, 0, 0, &width, &height)
	width = min(width, maxWidth)
	clip := rectangle{0, 0, width, height}
	s.copyTexture(s.renderer, texture, &clip, &rectangle{x, y, width, height})
}

func (s *screen) action() string {
	var event [7]uint64
	if s.wait(unsafe.Pointer(&event[0]), 100) == 0 {
		return ""
	}
	switch uint32(event[0]) {
	case 0x100:
		return "quit"
	case 0x300:
		return map[uint32]string{13: "select", 27: "back", 1073741906: "up",
			1073741905: "down", 1073741904: "prev", 1073741903: "next",
			1073741899: "page-prev", 1073741902: "page-next",
			1073741883: "submit", 8: "page-prev", 32: "space"}[uint32(event[2]>>32)]
	case 0x651:
		return map[uint8]string{0: "select", 1: "back", 2: "space", 6: "submit", 9: "page-prev", 10: "page-next",
			11: "up", 12: "down", 13: "prev", 14: "next"}[uint8(event[1]>>32)]
	}
	return ""
}
