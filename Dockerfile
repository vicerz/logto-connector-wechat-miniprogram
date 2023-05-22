FROM svhd/logto:latest
COPY . /etc/logto/packages/connector/connector-wechat-miniprogram
RUN npm add --location=global pnpm@^8.0.0
RUN cd /etc/logto && pnpm npm:devPreinstall && pnpm i && pnpm connectors:build && pnpm cli connector link
WORKDIR /etc/logto
EXPOSE 3001
ENTRYPOINT ["npm", "start"]
