// Refer to https://docs.basis-ai.com/getting-started/writing-files/bedrock.hcl for more details.
version = "1.0"

serve {
    image = "basisai/express-flask:v0.0.3"
    install = [
        "pip install -r requirements.txt",
    ]
    script = [
        {sh = [
            "entrypoint.sh"
        ]}
    ]

    parameters {
        // This should be the name of python module that has a subclass of BaseModel 
        // https://github.com/basisai/bedrock-express#creating-a-model-server
        // If not specified as a parameter it defaults to "serve"
        BEDROCK_SERVER = "serve"
        // Number of gunicorn workers to use
        WORKERS = 2
        // Gunicorn log level
        LOG_LEVEL = "INFO"
        
        // For a set of environment variables available for the image, see
        // https://github.com/basisai/bedrock-express/blob/master/Dockerfile
    }
}
