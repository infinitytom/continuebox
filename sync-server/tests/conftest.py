import os
os.environ.setdefault("TOKEN_SECRET", "isolated-tests-secret-at-least-32-characters")

import pytest
from fastapi.testclient import TestClient
import app.main as main
from app import security


@pytest.fixture(autouse=True)
def verified_registrations_for_legacy_api_tests(request, monkeypatch):
    """Keep existing media/sync regressions on the real verified registration path."""
    if not request.module.__name__.endswith(("test_api", "test_reliability")):
        return
    codes = {}
    monkeypatch.setattr(security, "mail_ready", lambda: True)
    monkeypatch.setattr(security, "deliver", lambda email, code, purpose: codes.update({email: code}))
    original = TestClient.post
    def post(client, url, **kwargs):
        if url == "/api/v1/auth/register" and "email" not in kwargs.get("json", {}):
            data = dict(kwargs["json"])
            email = data["username"] + "@example.com"
            result = original(client, "/api/v1/auth/email-code", json={"email": email})
            assert result.status_code == 200, result.text
            data.update(email=email, code=codes[email])
            kwargs["json"] = data
        return original(client, url, **kwargs)
    monkeypatch.setattr(TestClient, "post", post)
