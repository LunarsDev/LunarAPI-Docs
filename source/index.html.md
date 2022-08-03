---
title: Lunar API

language_tabs: # must be one of https://git.io/vQNgJ
  - python

toc_footers:
  - <a href='lunardev.group/apply'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/slatedocs/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true

code_clipboard: true

meta:
  - name: description
    content: Documentation for the Lunar API
---

# Introduction

Welcome to the Lunar API! With our async API, you can retrieve image data for NSFW images of multiple categories. Image generation, such as welcome banners, memes, and more!

We have language bindings in Python! You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right (only currently supported languages are provided a tab).

# Authentication

> To authorize, use this code:

```python
from pylunar import Client, endpoints
from aiohttp import ClientSession
import asyncio

token = "Bearer <JWT>" # Replace with your Lunar API Key.

async def main():
  async with ClientSession() as session:
    client = Client(session=session, token=token)

    image = await client.request(endpoints.generate_achievement, text="Woo! I made a request!")
    await image.save("image.jpg")  

    nsfw_jpg = await client.request(endpoints.nsfw("jpg"))
    data = await nsfw_jpg.to_dict()
    print("Image URL is", data["url"])

asyncio.run(main())
```

> Make sure to replace `Bearer <JWT>` with your API key.

Lunar API uses API keys to allow access to the API. You can apply for an API key at our [application page](https://lunardev.group/apply) or request on directly in our [Discord](https://lunardev.group/discord)

Lunar expects for the API key to be included in all API requests to the server in a header that looks like the following:

`Authorization: Bearer eyJ0eXAiORX00IsyJzW4Ovsux-ciOiJIUzI1NiJ9.eyJpYXQiOjE2NTg3MjE0NDUsIm5iZiI6MTY1ODcyMTQ0NSwianRpIjoiNDQ5MDkwZjQtNTg5NC00ODNiLTkzMDEtMWU3OTNlMzJmZmRkIiwiaWRlbnRpdHkiOiJMdW5hciIsImZyZXNoIjpmYWxzZSwidHlwZSI6ImFjY2VzcyJ9.nJsgmXX6jy1BZX8soYuQcDwUXM`

<aside class="notice">
You must replace <code>Bearer JWT</code> with your personal API key.
</aside>

# Image Generation

## Welcome Image Generation

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.get()
```

> The above command returns a Bytes-like object:

```
[Image]
```

This endpoint generates a welcome image

### HTTP Request

`GET https://api.lunardev.group/gen/welcome?avatar=url&username=text`

### Query Parameters

Parameter | Default | Description | Required
--------- | ------- | ----------- | -----------
avatar | null | Set the profile image in the image. | True
username | null | Set the username for the user in the image | True

<aside class="success">
Remember — This is returning a bytes-like object!
</aside>
