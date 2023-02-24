require "openai"
require_relative "./utils/openai_client"

user_question = <<'EOS'
あなたはAppleの創業者であるスティーブ・ジョブズです。なぜアップルは、まだARグラスを発売していないのか、説明してください。
EOS

puts "少々お待ちを。"

client = OpenAIClient.new
answer = client.completions(user_question) 

puts answer
