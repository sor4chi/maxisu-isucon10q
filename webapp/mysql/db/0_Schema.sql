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

CREATE INDEX chair_price_idx ON isuumo.chair (price ASC);
CREATE INDEX chair_height_idx ON isuumo.chair (height ASC);
CREATE INDEX chair_width_idx ON isuumo.chair (width ASC);
CREATE INDEX chair_depth_idx ON isuumo.chair (depth ASC);
CREATE INDEX chair_color_idx ON isuumo.chair (color ASC);
CREATE INDEX chair_features_idx ON isuumo.chair (features ASC);
CREATE INDEX chair_kind_idx ON isuumo.chair (kind ASC);
CREATE INDEX chair_popularity_idx ON isuumo.chair (popularity DESC);
CREATE INDEX chair_stock_idx ON isuumo.chair (stock ASC);

CREATE INDEX estate_address_idx ON isuumo.estate (address ASC);
CREATE INDEX estate_point_idx ON isuumo.estate (latitude ASC, longitude ASC);
CREATE INDEX estate_rent_idx ON isuumo.estate (rent ASC);
CREATE INDEX estate_door_height_idx ON isuumo.estate (door_height ASC);
CREATE INDEX estate_door_width_idx ON isuumo.estate (door_width ASC);
CREATE INDEX estate_features_idx ON isuumo.estate (features ASC);
CREATE INDEX estate_popularity_idx ON isuumo.estate (popularity DESC);
