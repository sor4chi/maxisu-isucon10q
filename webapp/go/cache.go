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
