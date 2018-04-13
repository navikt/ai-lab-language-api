from aiohttp import web
import multiprocessing
import fastText

async def about(request):
    text = "Server: Gunicorn. CPU count: " + str(multiprocessing.cpu_count())
    text = text + "\n\n" + "Example:"
    text = text + "\n\n" + "post('http://url/language', params='', data=json.dumps({'text': 'Nynorsk og bokmål er jamstilte målformer i Noreg, og det har dei to skriftspråka vore sidan 1885.'}), headers={'content-type': 'application/json'})"
    return web.Response(text=text)


async def post_language(request):
    try:
        data = await request.json()
        text = data['text']
        model = fastText.load_model("./models/lid.176.bin")
        output = model.predict(text,1)
        language = output[0][0].replace('__label__','')
        res = {"language": language}
    except:
        res = {"language": "na"}
    return web.json_response(res)



app = web.Application()
app.router.add_get('/', about)
app.router.add_post('/language', post_language)


if __name__ == '__main__':
    web.run_app(app, port=5858)

