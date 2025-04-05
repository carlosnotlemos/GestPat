# Limpando o banco antes de popular (opcional, útil para testes)
User.destroy_all
Room.destroy_all
AssetType.destroy_all
Asset.destroy_all
Inventory.destroy_all
InventoryAsset.destroy_all
FoundItem.destroy_all

# Criando usuários
professor = User.create!(email: "professor@example.com", password: "senha123", name: "Professor João", role: 0)
ferramentaria = User.create!(email: "ferramentaria@example.com", password: "senha123", name: "Ferramentaria", role: 1)
estagiario = User.create!(email: "estagiario@example.com", password: "senha123", name: "Estagiário Lucas", role: 2)
assistente = User.create!(email: "assistente@example.com", password: "senha123", name: "Assistente Maria", role: 3)
coordenador = User.create!(email: "coordenador@example.com", password: "senha123", name: "Coordenador Ana", role: 4)
gestor = User.create!(email: "gestor@example.com", password: "senha123", name: "Gestor Pedro", role: 5)

# Criando salas
sala_101 = Room.create!(name: "Sala 101")
sala_102 = Room.create!(name: "Sala 102")
sala_201 = Room.create!(name: "Sala 201")
ferramentaria_room = Room.create!(name: "Ferramentaria")

# Criando tipos de patrimônio
cadeira_tipo = AssetType.create!(name: "Cadeira")
mesa_tipo = AssetType.create!(name: "Mesa")
projetor_tipo = AssetType.create!(name: "Projetor")
computador_tipo = AssetType.create!(name: "Computador")
multimetro_tipo = AssetType.create!(name: "Multimetro")

# Criando patrimônios (associando às salas e quantidades)
cadeiras_101 = Asset.create!(room: sala_101, asset_type: cadeira_tipo, quantity: 10)
mesas_101 = Asset.create!(room: sala_101, asset_type: mesa_tipo, quantity: 5)
cadeiras_102 = Asset.create!(room: sala_102, asset_type: cadeira_tipo, quantity: 8)
projetor_102 = Asset.create!(room: sala_102, asset_type: projetor_tipo, quantity: 1)
cadeiras_201 = Asset.create!(room: sala_201, asset_type: cadeira_tipo, quantity: 12)
computadores_201 = Asset.create!(room: sala_201, asset_type: computador_tipo, quantity: 4)
multimetro_ferramentaria = Asset.create!(room: ferramentaria_room, asset_type: multimetro_tipo, quantity: 5)

# Criando inventários (verificações de patrimônios feitas pelos usuários)
inventory_101 = Inventory.create!(user: professor, room: sala_101, checked_at: Time.now)
inventory_102 = Inventory.create!(user: professor, room: sala_102, checked_at: Time.now)
inventory_201 = Inventory.create!(user: professor, room: sala_201, checked_at: Time.now)
inventory_ferramentaria = Inventory.create!(user: ferramentaria, room: ferramentaria_room, checked_at: Time.now)

# Registrando contagem dos patrimônios no inventário
InventoryAsset.create!(inventory: inventory_101, asset: cadeiras_101, counted_quantity: 10)
InventoryAsset.create!(inventory: inventory_101, asset: mesas_101, counted_quantity: 5)
InventoryAsset.create!(inventory: inventory_102, asset: cadeiras_102, counted_quantity: 8)
InventoryAsset.create!(inventory: inventory_102, asset: projetor_102, counted_quantity: 1)
InventoryAsset.create!(inventory: inventory_201, asset: cadeiras_201, counted_quantity: 12)
InventoryAsset.create!(inventory: inventory_201, asset: computadores_201, counted_quantity: 4)
InventoryAsset.create!(inventory: inventory_ferramentaria, asset: multimetro_ferramentaria, counted_quantity: 4)

# Criando objetos encontrados (itens fora do lugar)
FoundItem.create!(inventory: inventory_101, description: "Projetor deixado na sala errada", quantity: 1)
FoundItem.create!(inventory: inventory_102, description: "Computador encontrado sem etiqueta", quantity: 1)
FoundItem.create!(inventory: inventory_ferramentaria, description: "Cadeira com perna quebrada", quantity: 1)

puts "Banco de dados populado com sucesso! 🚀"


# SELECT
#     users.name AS professor,
#     rooms.name AS sala,
#     asset_types.name AS patrimonio,
#     inventory_assets.counted_quantity AS quantidade,
#     inventories.checked_at AS data,
#     COALESCE(found_items.description, 'Nenhum') AS objeto_encontrado,
#     COALESCE(found_items.quantity, 0) AS quantidade_objeto
# FROM inventories
# JOIN users ON inventories.user_id = users.id
# JOIN rooms ON inventories.room_id = rooms.id
# JOIN inventory_assets ON inventory_assets.inventory_id = inventories.id
# JOIN assets ON inventory_assets.asset_id = assets.id
# JOIN asset_types ON assets.asset_type_id = asset_types.id
# LEFT JOIN found_items ON found_items.inventory_id = inventories.id
# WHERE users.role = 0 -- Apenas professores
# AND DATE(inventories.checked_at) = CURRENT_DATE
# ORDER BY inventories.checked_at DESC;
