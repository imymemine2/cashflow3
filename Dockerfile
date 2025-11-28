# 1. Java 17の環境を用意する
FROM eclipse-temurin:17-jdk-alpine

# 2. 作業フォルダを作る
WORKDIR /app

# 3. プロジェクトのファイルを全てコピーする
COPY . .

# 4. Mavenラッパー（ビルドツール）を実行可能にする
RUN chmod +x mvnw

# 5. アプリをビルド（作成）する。テストはスキップして時短。
RUN ./mvnw clean package -DskipTests

# 6. アプリを起動する
# jarファイルの名前は pom.xml の設定に基づいています
CMD ["java", "-jar", "target/CashFlowWeb-0.0.1-SNAPSHOT.jar"]