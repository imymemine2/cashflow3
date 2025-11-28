# ベースイメージの指定
FROM node:20-alpine

# 作業ディレクトリの設定
WORKDIR /usr/src/app

# package.jsonとpackage-lock.jsonをコピー
# package-lock.jsonがない場合もエラーにならないよう、複数行に分けます。
COPY package.json ./
COPY package-lock.json ./

# 依存関係をインストール
RUN npm install --production

# アプリケーションコードのコピー
COPY . .

# ポートの指定
EXPOSE 3000

# アプリケーションの起動コマンド
CMD [ "npm", "start" ]