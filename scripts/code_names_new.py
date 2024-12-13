import pandas as pd

category_data = {
    "category_code": [
        "44X72", "44Y72", "44Z72", "44W72", "44000", "4400A", "4400C", "441", "441X",
        "4411", "44111", "44112", "4413", "4423X", "442", "4421", "4422", "44221",
        "442299", "443", "443141", "443142", "444", "4441", "44412", "44413", "445",
        "4451", "44511", "4453", "446", "44611", "447", "448", "4481", "44811",
        "44812", "44814", "44819", "4482", "44831", "451", "45111", "45112", "451211",
        "452", "4521E", "452112E", "452111E", "4529", "45291", "45299", "453", "4532",
        "45321", "45322", "45330", "454", "4541", "45431", "722", "7224", "7225",
        "722511", "72251X"
    ],
    "category_name": [
        # Same as before for category names
    ],
    "high_level_category": [
        "Aggregated Categories", "Aggregated Categories", "Aggregated Categories", "Aggregated Categories",
        "Aggregated Categories", "Aggregated Categories", "Aggregated Categories", "Automotive",
        "Automotive", "Automotive", "Automotive", "Automotive", "Automotive", "Home & Furnishings",
        "Home & Furnishings", "Home & Furnishings", "Home & Furnishings", "Home & Furnishings",
        "Home & Furnishings", "Electronics & Appliances", "Electronics & Appliances", "Electronics & Appliances",
        "Building & Garden Supplies", "Building & Garden Supplies", "Building & Garden Supplies",
        "Building & Garden Supplies", "Food & Beverages", "Food & Beverages", "Food & Beverages",
        "Food & Beverages", "Health & Personal Care", "Health & Personal Care", "Gas & Fuel",
        "Clothing & Accessories", "Clothing & Accessories", "Clothing & Accessories", "Clothing & Accessories",
        "Clothing & Accessories", "Clothing & Accessories", "Clothing & Accessories", "Sports & Hobby",
        "Sports & Hobby", "Sports & Hobby", "Books & Stationery", "General Merchandise",
        "General Merchandise", "General Merchandise", "General Merchandise", "General Merchandise",
        "General Merchandise", "General Merchandise", "Other Specialty Stores", "Books & Stationery",
        "Books & Stationery", "Books & Stationery", "Other Specialty Stores", "Nonstore Retail",
        "Nonstore Retail", "Nonstore Retail", "Food Services", "Food Services", "Food Services",
        "Food Services", "Food Services"
    ]
}

categories_df = pd.DataFrame(category_data)
categories_df.to_csv("../data/mrts_code_categories_with_granular_high_level.csv", index=False)

print("MRTS categories with refined high-level categories saved.")
