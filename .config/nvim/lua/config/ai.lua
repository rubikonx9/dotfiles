require("gp").setup({
    openai_api_key = os.getenv("OPENAI_API_KEY"),
    providers = {
        openai = {
            endpoint = "@TODO"
        }
    }
});
