FROM svhd/logto:latest
COPY . /etc/logto/packages/connector/connector-wechat-miniprogram
RUN cd /etc/logto && npm npm:devPreinstall && npm i && npm connectors:build && npm cli connector link
WORKDIR /etc/logto
EXPOSE 3001
ENTRYPOINT ["npm", "start"]
