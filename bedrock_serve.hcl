// Refer to https://docs.basis-ai.com/getting-started/writing-files/bedrock.hcl for more details.
version = "1.0"

serve {
    image = "basisai/express-flask:v0.0.1"
    install = [
        "pip install -r requirements.txt",
    ]
    script = [
        {sh = [
            "/app/entrypoint.sh"
        ]}
    ]

    parameters {
        BEDROCK_SERVER = "serve"
        WORKERS = "2"
    }
}
