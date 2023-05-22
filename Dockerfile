FROM svhd/logto:latest
COPY . /etc/logto/packages/connector/connector-wechat-miniprogram/
RUN npm add --location=global pnpm@^8.5.0
RUN node .scripts/update-parcelrc.js
RUN pnpm i
RUN pnpm -r update
RUN pnpm pnpm:devPreinstall
RUN pnpm connectors:build && pnpm cli connector link
WORKDIR /etc/logto
RUN npx @logto/cli connector link
EXPOSE 3001
ENTRYPOINT ["npm", "start"]
