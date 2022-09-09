puts "🌱 Seeding spices..."

# Seed your database here
# Regimes
Regime.create(name: "low sugar")
Regime.create(name: "paleo")
Regime.create(name: "keto")
Regime.create(name: "vegan")
Regime.create(name: "gluten free")

Ingredient.create(name: "milk")
Ingredient.create(name: "almond")
Ingredient.create(name: "egg")
Ingredient.create(name: "butter")
Ingredient.create(name: "chocolate")
Ingredient.create(name: "sugar")

puts "✅ Done seeding!"
