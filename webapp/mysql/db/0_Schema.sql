DROP DATABASE IF EXISTS isuumo;
CREATE DATABASE isuumo;

DROP TABLE IF EXISTS isuumo.estate;
DROP TABLE IF EXISTS isuumo.chair;

CREATE TABLE isuumo.estate
(
    id          INTEGER             NOT NULL PRIMARY KEY,
    name        VARCHAR(64)         NOT NULL,
    description VARCHAR(4096)       NOT NULL,
    thumbnail   VARCHAR(128)        NOT NULL,
    address     VARCHAR(128)        NOT NULL,
    latitude    DOUBLE PRECISION    NOT NULL,
    longitude   DOUBLE PRECISION    NOT NULL,
    rent        INTEGER             NOT NULL,
    door_height INTEGER             NOT NULL,
    door_width  INTEGER             NOT NULL,
    features    VARCHAR(64)         NOT NULL,
    popularity  INTEGER             NOT NULL
);

CREATE TABLE isuumo.chair
(
    id          INTEGER         NOT NULL PRIMARY KEY,
    name        VARCHAR(64)     NOT NULL,
    description VARCHAR(4096)   NOT NULL,
    thumbnail   VARCHAR(128)    NOT NULL,
    price       INTEGER         NOT NULL,
    height      INTEGER         NOT NULL,
    width       INTEGER         NOT NULL,
    depth       INTEGER         NOT NULL,
    color       VARCHAR(64)     NOT NULL,
    features    VARCHAR(64)     NOT NULL,
    kind        VARCHAR(64)     NOT NULL,
    popularity  INTEGER         NOT NULL,
    stock       INTEGER         NOT NULL
);

-- SearchChair
CREATE INDEX chair_price_stock_idx ON isuumo.chair (price ASC, stock ASC);
CREATE INDEX chair_height_stock_idx ON isuumo.chair (height ASC, stock ASC);
CREATE INDEX chair_width_stock_idx ON isuumo.chair (width ASC, stock ASC);
CREATE INDEX chair_depth_stock_idx ON isuumo.chair (depth ASC, stock ASC);
CREATE INDEX chair_kind_stock_idx ON isuumo.chair (kind ASC, stock ASC);
CREATE INDEX chair_color_stock_idx ON isuumo.chair (color ASC, stock ASC);
CREATE INDEX chair_features_stock_idx ON isuumo.chair (features ASC, stock ASC);

-- BuyChair
CREATE INDEX chair_stock_idx ON isuumo.chair (stock ASC);

-- getLowPricedChair
CREATE INDEX chair_price_id_idx ON isuumo.chair (price ASC, id ASC);

-- SearchEstate
CREATE INDEX estate_door_height_idx ON isuumo.estate (door_height ASC);
CREATE INDEX estate_door_width_idx ON isuumo.estate (door_width ASC);
CREATE INDEX estate_rent_idx ON isuumo.estate (rent ASC);
CREATE INDEX estate_features_idx ON isuumo.estate (features ASC);
CREATE INDEX estate_popularity_id_idx ON isuumo.estate (popularity DESC, id ASC);

-- getLowPricedEstate
CREATE INDEX estate_rent_id_idx ON isuumo.estate (rent ASC, id ASC);

-- searchRecommendedEstateWithChair
CREATE INDEX estate_doors_idx ON isuumo.estate (door_height ASC, door_width ASC);

-- searchEstateNazotte
CREATE INDEX estate_latlon_idx ON isuumo.estate (latitude ASC, longitude ASC);