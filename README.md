# jwks

Scripts for generating JSON web key files. The certificates and generated tokens
here are exclusively used for public access. In order to generate a JWT generate
certificates first.

```
./gen.sh
```

Head over to https://jwt.io and ensure the following header and payload data.

```
{
  "alg": "RS512",
  "typ": "JWT"
}
```

```
{
  "sub": "webclient"
}
```

Put the content of `oidc-issuer.pub` and `oidc-issuer.key` into the input fields
for public key and private key respectively. At this point the signature should
be valid. An example JWT signed by the generated certificates and ready to be
used is shown below.

```
eyJhbGciOiJSUzUxMiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJ3ZWJjbGllbnQifQ.LHNDbnzaYRPulDBLDNnBZYYVHi7yA_lfSEEld6pGWjQ9cBqBA4gVUCrXogobYufcrE6pDaCANX7xKZnSa7a3aztYEy1khZR7s2iLgaYVaNZXZca4-PwSE4_-lnW2XakVsEBiIu3JgbQI-jy_HOC4LzP3QiSQeP9GS6QR1UEdc9J8fkh8cj8sig2i2fAUg-vUQ2dpWhsaPldiWqUWqgh2tqK5g0BHcUGdT8_pEnHZp8iGF99AjsZ8cOZ4Cb8veLEL0u9be-eBP5Ru_IB-lQjj6iGX8oph7M0hsJr0dHxIh9w31OsmurmfS6meoQCbL0Z5Be6msIzOWywLEO1LCGGFMA
```

The JWKS URL is
https://raw.githubusercontent.com/venturemark/jwks/main/.well-known/keys.json.
