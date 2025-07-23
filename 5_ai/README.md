# Lab 5: Run AI locally

In this lab, you will learn how to run LLM models locally using Ollama


## Preparation

### Ollama

1. Install Ollama (open-source) - https://ollama.com/download
2. Run `ollama --version` to verify installation. (Output example: `ollama version is 0.8.0`)


## Task - Part 1 (Terminal)

### Running the LLM model

1. Explore available models - https://ollama.com/search
2. Run `ollama pull qwen2.5:0.5b` - smallest model (398Mb), feel free to choose any other model
3. Disconnect device from internet
4. Run `ollama pull qwen2.5:0.5b`
5. Ask LLM couple of questions of your choice. Example

- Ask “What is DevOps?”
- Ask to create hello world program in python
- Ask to create simple HTML

### Defining Context 

6. Tell it your name (or fake name)
7. Change system prompt / instruction:

```
>>> /set system Answer in valid JSON only. 
Set system message.
>>> my name
{“name":"Klim"}
```

8. Run `/save my_own_llm`
9. Run `/bye` to exit


### Restoring Context  


10. Now, load model again `ollama pull qwen2.5:0.5b`
11. Ask about your name (or any other fact) -> should not return your name (no context)

12. Run `/load my_own_llm`
13. Ask about your name (or any other fact) -> it should your name


Example:

```
klim@mac % ollama run llama3.2:latest
>>> my name?
I don't know your name. This is the start of our conversation, and I haven't been told who you are or what we're talking about. Would you like to share your name with me?

>>> /load my_own_llm
Loading model 'my_own_llm'

>>> my name?
"Klim"
```


### Other commands

14. Run /?
15. Run /show info
16. Run /show license

### Finish

17. Exit using `/bye`


## Task - Part 2 (Web UI)

(enable internet if it was disabled)

1. Run `docker compose up`

```
docker run -d -p 3000:8080 --add-host=host.docker.internal:host-gateway -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:main
```
2. In new terminal window, run `docker logs open-webui -f` Wait until you see the following message. This might few minutes on slow internet


```
...

Fetching 30 files: 100%|██████████| 30/30 [02:13<00:00,  4.45s/it]
open-webui  | INFO:     Started server process [1]
open-webui  | INFO:     Waiting for application startup
```


3. Open `localhost:3000`
4. Create acccount (data stored locally on your machine)
5. Start new conversatoin with the same model from Ollama (task 1)
6. Stop container using `docker stop open-webui`
7. When needed, run docker container using `docker start open-webui`
