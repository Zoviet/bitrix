local json = require('cjson')
local api = require('bitrix.api')
local log = require('utils.log')
log.outfile = 'logs/tests_'..os.date('%Y-%m-%d')..'.log' 
log.level = 'trace'	

local deal_id = 158811
local test_date = '2025-01-05'

local function get_statuses()
	log.info('Поля статусов CRM: '..json.encode(api.status.fields()))
	log.info('Статусы сделок : '..json.encode(api.status.list(nil,{['ENTITY_ID']='DEAL_TYPE'})))
end

local function test_deal_get(id)
	local result = api.deal.get(id)
	if result.BEGINDATE then log.info('Тест получения сделок: успешно') 
	else log.error('Тест получения сделок: провален '..json.encode(result)) end 
	result = api.deal.productrows.get(id)
	if result[1].PRODUCT_ID then log.info('Тест получения продукта сделки: успешно') 
	else log.error('Тест получения продукта сделки: провален '..json.encode(result)) end 
end

local function test_deal_add_update_delete()
	local result = api.deal.add(id)
	if result.BEGINDATE then log.info('Тест получения сделок: успешно') 
	else log.error('Тест получения сделок: провален '..json.encode(result)) end 
	result = api.deal.productrows.get(id)
	if result[1].PRODUCT_ID then log.info('Тест получения продукта сделки: успешно') 
	else log.error('Тест получения продукта сделки: провален '..json.encode(result)) end 
end

local function test_deal_list()
	local result = api.deal.list({'*'},{['STAGE_ID']='NEW',['>DATE_CREATE']=test_date})
	if #result ~= tonumber(api.res.total) then 
		log.error('Ошибка обработки листинга сделок '..json.encode(api.res)) 
	else
		log.info('Тест листинга сделок: успешно') 
	end
end

get_statuses()
test_deal_get(deal_id)
test_deal_list()


