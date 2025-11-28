# 1. ベースイメージの指定
# Node.js 20の安定版（軽量なAlpine Linuxベース）を使用します。
FROM node:20-alpine

# 2. 作業ディレクトリの設定
# コンテナ内で作業を行うディレクトリを /usr/src/app に設定します。
WORKDIR /usr/src/app

# 3. 依存関係ファイルのコピーとインストール
# package.json と package-lock.json（または yarn.lock）のみをコピーします。
# これにより、依存関係が変わらない限り、この層のビルドキャッシュが再利用され、高速化されます。
COPY package*.json ./

# 依存関係をインストール
RUN npm install --production

# 4. アプリケーションコードのコピー
# 残りの全てのソースコード（server.jsなど）をコンテナにコピーします。
COPY . .

# 5. ポートの指定
# アプリケーションが待ち受けるポートを外部に公開します。
# ほとんどのNode.js Webアプリではデフォルトで3000番が使われます。
EXPOSE 3000

# 6. アプリケーションの起動コマンド
# コンテナが起動したときに実行するコマンドを指定します。
# package.jsonに定義されている "start" スクリプトを実行するのが最も確実です。
CMD [ "npm", "start" ]