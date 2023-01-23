Config = {

    Locations = {

        [1] = {
            ["cashier"] = {
                ["x"] = 2975.59, ["y"] = 2792.34, ["z"] = 40.61,
            },
        },
        [2] = {
            ["cashier"] = {
                ["x"] = 2968.9, ["y"] = 2776.59, ["z"] = 38.4,
            },
        },
        [3] = {
            ["cashier"] = {
                ["x"] = 2951.69, ["y"] = 2769.38, ["z"] = 39.04,
            },
        },
    },
}



Config.NPC = vector4(1915.4, 582.73, 176.37, 243.9) -- Yıkama npc kordinat & yıkama kordinatı
Config.SellNPC = vector4(2569.24, 2720.38, 42.96, 210.2) -- Satış NPC kordinat
Config.EritmeCoord = vector3(1110.0, -2008.06, 31.06) -- Eritme Kordinatları
Config.MarkerBoyu = 1.0 -- marker boyu
Config.MarkerTipi = 2 -- marker tipi

Config.bankorcash = "cash" -- bank / cash (bank bankaya / cash üstüne para verir)

Config.BlipAc = true -- true ise blipler gözükür / false ise blipler gözükmez
Config.MineName = "Maden" -- Madenin blip adı
Config.MeltName = "Maden Eritme" -- Yıkanmış taşları eritilen yerin blipinin adı
Config.WashName = "Taş Yıkama" -- Taşları yıkama yerinin blipinin adı
Config.SellNPCName = "Maden Satıs" -- Maden Satış Yerinin Blipinin Adı

Config.tasmin = 1 --tek seferde kazılacak minimum taş
Config.tasmax = 10 --tek seferde kazılacak maksimum taş

Config.TasYikamaMiktar = 10 -- tek seferde yıkanıcak taş
Config.TasEritmeMiktar = 10 -- tek seferde eritilicek taş

Config.DiamondRatioMax = 5 -- ihtimalle elmas verir 5 ve 10 yaparsanız aynı şey olur
Config.DiamondRatioMin = 1 -- ihtimalle elmas verir 5 ve 10 yaparsanız aynı şey olur
Config.DiamondSellAmount = 5 -- tek seferde satılacak elmas miktarı
Config.DiamondSellPrice = 1000 -- elmas satış fiyatı

Config.MeltedDiamondRatioMax = 5 -- TasEritmeMiktar kadar taş erittikten sonra gelicek max elmas
Config.MeltedDiamondRatioMin = 1 -- TasEritmeMiktar kadar taş erittikten sonra gelicek min elmas 

Config.GoldRatioMax = 20 -- ihtimalle elmas verir 5 ve 10 yaparsanız aynı şey olur
Config.GoldRatioMin = 6 -- ihtimalle elmas verir 5 ve 10 yaparsanız aynı şey olur
Config.GoldSellAmount = 5 -- tek seferde satılacak altın miktarı
Config.GoldSellPrice = 800 -- altın satış fiyatı

Config.MeltedGoldRatioMax = 5 -- TasEritmeMiktar kadar taş erittikten sonra gelicek max Altın
Config.MeltedGoldRatioMin = 1 -- TasEritmeMiktar kadar taş erittikten sonra gelicek min Altın 

Config.CopperRatioMax = 50 -- ihtimalle elmas verir 5 ve 10 yaparsanız aynı şey olur
Config.CopperRatioMin = 21 -- ihtimalle elmas verir 5 ve 10 yaparsanız aynı şey olur
Config.CopperSellAmount = 10 -- tek seferde satılacak bakır miktarı
Config.CopperSellPrice = 500 -- bakır satış fiyatı

Config.MeltedCopperRatioMax = 5 -- TasEritmeMiktar kadar taş erittikten sonra gelicek max Bakır
Config.MeltedCopperRatioMin = 1 -- TasEritmeMiktar kadar taş erittikten sonra gelicek min Bakır 

Config.IronRatioMax = 100 -- ihtimalle elmas verir 5 ve 10 yaparsanız aynı şey olur
Config.IronRatioMin = 51 -- ihtimalle elmas verir 5 ve 10 yaparsanız aynı şey olur
Config.IronSellAmount = 10 -- tek seferde satılacak demir miktarı
Config.IronSellPrice = 200 -- demir satış fiyatı

Config.MeltedIronRatioMax = 5 -- TasEritmeMiktar kadar taş erittikten sonra gelicek max Demir
Config.MeltedIronRatioMin = 1 -- TasEritmeMiktar kadar taş erittikten sonra gelicek min Demir 

Config.UseTextUI = true -- true ise text ui kullanır değil ise drawtext3d kullanır
Config.TextUI = "aty_textui" -- okokTextUI / aty_textui
