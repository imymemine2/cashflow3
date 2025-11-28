# 1. Java 17の環境を用意する (Mavenも含まれています)
FROM eclipse-temurin:17-jdk-alpine

# 2. 作業フォルダを作る
WORKDIR /app

# 3. プロジェクトのファイルを全てコピーする
COPY . .

# 4. アプリをビルド（作成）する
# 【修正点】mvnw (ラッパー) ではなく、コンテナ内の mvn コマンドを直接使います
# chmod +x mvnw の行は不要なので削除しました
RUN mvn clean package -DskipTests

# 5. アプリを起動する
# jarファイルの名前は pom.xml の設定に基づいています
CMD ["java", "-jar", "target/CashFlowWeb-0.0.1-SNAPSHOT.jar"]