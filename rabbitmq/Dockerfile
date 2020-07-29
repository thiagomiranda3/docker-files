FROM rabbitmq:3.8.5-management-alpine

COPY rabbitmq_delayed_message_exchange-3.8.0.ez /plugins

# Instalando o Plugin de Delayed Messages
RUN rabbitmq-plugins enable rabbitmq_delayed_message_exchange