package main

type EstateCache struct {
	search    map[string]EstateSearchResponse
	detail    map[string]Estate
	lowPriced []Estate
}

func (c *EstateCache) GetSearch(key string) (EstateSearchResponse, bool) {
	val, ok := c.search[key]
	return val, ok
}

func (c *EstateCache) SetSearch(key string, value EstateSearchResponse) {
	c.search[key] = value
}

func (c *EstateCache) PurgeSearch() {
	c.search = make(map[string]EstateSearchResponse)
}

func (c *EstateCache) GetDetail(key string) (Estate, bool) {
	val, ok := c.detail[key]
	return val, ok
}

func (c *EstateCache) SetDetail(key string, value Estate) {
	c.detail[key] = value
}

func (c *EstateCache) GetLowPriced() ([]Estate, bool) {
	if len(c.lowPriced) == 0 {
		return nil, false
	}
	return c.lowPriced, true
}

func (c *EstateCache) SetLowPriced(value []Estate) {
	c.lowPriced = value
}

func (c *EstateCache) PurgeLowPriced() {
	c.lowPriced = make([]Estate, 0)
}

func NewEstateCache() *EstateCache {
	return &EstateCache{
		search:    make(map[string]EstateSearchResponse),
		detail:    make(map[string]Estate),
		lowPriced: make([]Estate, 0),
	}
}

type ChairCache struct {
	search map[string]ChairSearchResponse
	detail map[string]Chair
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

func (c *ChairCache) GetDetail(key string) (Chair, bool) {
	val, ok := c.detail[key]
	return val, ok
}

func (c *ChairCache) SetDetail(key string, value Chair) {
	c.detail[key] = value
}

func (c *ChairCache) PurgeDetailByKey(key string) {
	delete(c.detail, key)
}

func NewChairCache() *ChairCache {
	return &ChairCache{
		search: make(map[string]ChairSearchResponse),
		detail: make(map[string]Chair),
	}
}
