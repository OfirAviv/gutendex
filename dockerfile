FROM python:3.6
ENV ADMIN_NAMES=You
ENV ADMIN_EMAILS=you@your.domain.here
ENV ALLOWED_HOSTS=127.0.0.1,localhost
ENV DATABASE_HOST=db
ENV DATABASE_NAME=gutendex
ENV DATABASE_PASSWORD=password
ENV DATABASE_PORT=5432
ENV DATABASE_USER=postgres
ENV DEBUG=true
ENV EMAIL_HOST=your.smtp.host.here
ENV EMAIL_HOST_ADDRESS=gutendex@your.domain.here
ENV EMAIL_HOST_PASSWORD=your-smtp-host-password
ENV EMAIL_HOST_USER=your-smtp-host-user-name
ENV MANAGER_EMAILS=someone@their.domain.here
ENV MANAGER_NAMES=Someone
ENV MEDIA_ROOT=/var/www/gutendex/media/
ENV SECRET_KEY=root
ENV STATIC_ROOT=/var/www/gutendex/static-root/
WORKDIR /app
COPY . .
RUN chmod +x manage.py
RUN chmod +x entrypoint.sh
RUN apt update && apt install rsync -y
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
ENTRYPOINT sh entrypoint.sh