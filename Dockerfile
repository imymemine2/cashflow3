# 1. MavenとJava 17が含まれる公式イメージを使用する
# (修正: eclipse-temurinだけではmvnコマンドがないため、mavenイメージに変更しました)
FROM maven:3.9-eclipse-temurin-17-alpine

# 2. 作業フォルダを作る
WORKDIR /app

# 3. プロジェクトのファイルを全てコピーする
COPY . .

# 4. アプリをビルド（作成）する
# Mavenイメージを使うことで mvn コマンドが確実に使えます
RUN mvn clean package -DskipTests

# 5. アプリを起動する
# jarファイルの名前は pom.xml の設定に基づいています
CMD ["java", "-jar", "target/CashFlowWeb-0.0.1-SNAPSHOT.jar"]