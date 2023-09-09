package main

type EstateCache struct {
	search map[string]EstateSearchResponse
}

func (c *EstateCache) Get(key string) (EstateSearchResponse, bool) {
	val, ok := c.search[key]
	return val, ok
}

func (c *EstateCache) Set(key string, value EstateSearchResponse) {
	c.search[key] = value
}

func (c *EstateCache) PurgeSearch() {
	c.search = make(map[string]EstateSearchResponse)
}

func NewEstateCache() *EstateCache {
	return &EstateCache{
		search: make(map[string]EstateSearchResponse),
	}
}

type ChairCache struct {
	search map[string]ChairSearchResponse
}

func (c *ChairCache) Get(key string) (ChairSearchResponse, bool) {
	val, ok := c.search[key]
	return val, ok
}

func (c *ChairCache) Set(key string, value ChairSearchResponse) {
	c.search[key] = value
}

func (c *ChairCache) PurgeSearch() {
	c.search = make(map[string]ChairSearchResponse)
}

func NewChairCache() *ChairCache {
	return &ChairCache{
		search: make(map[string]ChairSearchResponse),
	}
}
