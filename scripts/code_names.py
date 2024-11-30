import pandas as pd

category_data = {
    "category_code": [
        "44X72", "4521E", "44000", "444", "44Y72", "451", "453", "4451", "441",
        "454", "441X", "443", "447", "446", "452", "448", "445", "44W72", "442",
        "44Z72", "722"
    ],
    "category_name": [
        "Retail Trade and Food Services", "Department Stores", "Retail Trade",
        "Building Material and Garden Equipment and Supplies Dealers",
        "Retail Trade and Food Services, ex Auto",
        "Sporting Goods, Hobby, Musical Instrument, and Book Stores",
        "Miscellaneous Store Retailers", "Grocery Stores",
        "Motor Vehicle and Parts Dealers", "Nonstore Retailers",
        "Auto and Other Motor Vehicles", "Electronics and Appliance Stores",
        "Gasoline Stations", "Health and Personal Care Stores",
        "General Merchandise Stores", "Clothing and Accessories Stores",
        "Food and Beverage Stores", "Retail Trade and Food Services, ex Auto and Gas",
        "Furniture and Home Furnishings Stores", "Retail Trade and Food Services, ex Gas",
        "Food Services and Drinking Places"
    ]
}

categories_df = pd.DataFrame(category_data)

categories_df.to_csv("code_categories.csv", index=False)

print(f"Category codes saved")
