# Backend for Gen-Archi

## Build the Docker Image
```bash
docker build -t myimage .
```

uvicorn app.main:app --reload

## Launch Docker Container
```bash
docker run -d --name mycontainer -p 8080:80 myimage
```

## Files

├── app
│   ├── __init__.py
│   └── main.py
├── Dockfile
├── README.md
└── requirements.txt


## Documentation
https://fastapi.tiangolo.com/deployment/docker/
