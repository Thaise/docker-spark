FROM bde2020/spark-submit:2.4.4-hadoop2.7

COPY template.sh /

# Copy the requirements.txt first, for separate dependency resolving and downloading
ONBUILD COPY requirements.txt /app/
ONBUILD RUN cd /app \
      && pip3 install -r requirements.txt

# Copy the source code
ONBUILD COPY . /app

CMD [ "/bin/bash", "/template.sh" ]