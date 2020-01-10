FROM alpine:edge

# pg_dump version 12.1

ENV PGHOST='localhost'
ENV PGPORT='5432'
ENV PGDATABASE='postgres'
ENV PGUSER='postgres@postgres'
ENV PGPASSWORD='password'

RUN apk update
RUN apk add postgresql

COPY dumpDatabase.sh .

ENTRYPOINT [ "/bin/sh" ]
CMD [ "./dumpDatabase.sh" ]
