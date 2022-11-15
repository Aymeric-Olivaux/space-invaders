from typing import Union

from fastapi import FastAPI
from starlette.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from fastapi import Request

app = FastAPI()
origins = ["*"]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

import csv

class List(BaseModel):
    name: str
    score: int


mylist = "0"

@app.get("/")
def read_root():
    f = open("list.csv", "r")
    print(f.readlines())
    return 0

@app.post('/')
async def main(request: Request):
    res = await request.json()
    with open('./list.csv', 'a', newline='') as csvfile:
        spamwriter = csv.writer(csvfile, delimiter=' ',
                                quotechar='|', quoting=csv.QUOTE_MINIMAL)
        spamwriter.writerow([res["name"], res["score"]])
    return await request.json()

