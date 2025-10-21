# Limpar usuários existentes
Usuario.destroy_all

puts "👤 Criando usuários..."

Usuario.create!(
  nome: "Administrador",
  email: "admin@pointer.com",
  password: "123456",
  tipo: "administrador"
)

Usuario.create!(
  nome: "João Silva", 
  email: "joao@pointer.com",
  password: "123456",
  tipo: "membro"
)

puts "✅ #{Usuario.count} usuários criados!"
puts ""
puts "🎯 CREDENCIAIS PARA TESTE:"
puts "Administrador: admin@pointer.com / 123456"
puts "Membro: joao@pointer.com / 123456"