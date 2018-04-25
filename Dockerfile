FROM python:3

RUN git clone https://github.com/facebookresearch/fastText.git /tmp/fastText  && \
  cd /tmp/fastText && \
  pip install . && \
  rm -rf /tmp/fastText && \
  cd / 

COPY requirements.txt /
COPY gunicorn.conf /
RUN pip install gunicorn
RUN pip install -r requirements.txt

RUN  mkdir -p models

#COPY /models/lid.176.bin /models/lid.176.bin
ADD https://s3-us-west-1.amazonaws.com/fasttext-vectors/supervised_models/lid.176.bin /models/lid.176.bin


COPY server.py /

CMD [ "gunicorn", "-c", "gunicorn.conf", "server:app" ]
