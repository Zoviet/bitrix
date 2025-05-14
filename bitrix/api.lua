local json = require('cjson')
local cURL = require("cURL")
local log = require('utils.log')
local url = require('utils.url')
local config = require('config.bitrix')
local array = require('utils.array')

local _M = {}
_M.result = nil
log.outfile = 'logs/bitrix_'..os.date('%Y-%m-%d')..'.log' 
log.level = 'trace'	
_M.base = config.url..'/rest/'..config.user..'/'..config.token..'/';
_M.res = {} 
_M.format = config.format
_M.item = {}
_M.deal = {}
_M.deal.productrows = {}
_M.deal.userfield = {}
_M.deal.contact = {}
_M.deal.contact.items = {}
_M.deal.recurring = {}
_M.deal.contact.item = {}
_M.deal.details = {}
_M.deal.details.configuration = {}
_M.status = {}
_M.status.entity = {}
_M.category = {}

function get_result(str,url,full)
	local result, err = pcall(json.decode,str)
	if result then
		_M.result = json.decode(str)
	else
		log.error(url..':'..err)
		return nil,	err
	end	
	if _M.result.result then 
		if full then return _M.result else return _M.result.result end
	end
	log.error(url..str)
	return nil
end

function post(url,data,full)
	local str = ''
	url = _M.base..url
	local headers = {
		'Content-Type: application/json',
		'Accept: application/json'
	}
	local c = cURL.easy{		
		url = url,
		post = true,
		postfields = json.encode(data),  
		httpheader = headers,
		ssl_verifyhost = tonumber(config.ssl),
		ssl_verifypeer = tonumber(config.ssl),
		writefunction = function(st)		
			str = str..st
		end
	}
	local ok, err = c:perform()	
	local code = c:getinfo_response_code()
	c:close()
	if not ok then return nil, err end
	if code ~= 200 then 
		log.error(url..':'..str)
		return nil,str 
	end
	if _M.format == 'json' then
		res,err = get_result(str,url,full)
	else
		res = str
	end
	if not res then return nil,err end
	return res
end

--[[ 
	Items
--]]

-- https://apidocs.bitrix24.ru/api-reference/crm/universal/crm-item-fields.html

function _M.item.fields(entityTypeId,useOriginalUfNames)
	return post('crm.item.fields',{['entityTypeId']=entityTypeId,['useOriginalUfNames']=useOriginalUfNames})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/universal/crm-item-add.html

function _M.item.add(entityTypeId,fields,useOriginalUfNames)
	return post('crm.item.add',{['entityTypeId']=entityTypeId,['fields']=fields,['useOriginalUfNames']=useOriginalUfNames})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/universal/crm-item-update.html

function _M.item.update(entityTypeId,id,fields,useOriginalUfNames)
	return post('crm.item.update',{['entityTypeId']=entityTypeId,['id']=id,['fields']=fields,['useOriginalUfNames']=useOriginalUfNames})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/universal/crm-item-delete.html

function _M.item.delete(entityTypeId,id)
	return post('crm.item.delete',{['entityTypeId']=entityTypeId,['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/universal/crm-item-list.html

function _M.item.list(entityTypeId,sel,fields,filter,order,useOriginalUfNames,start)
	sel = sel or {'*'}
	if not start then 
		_M.listing = {} 
		start = 0
	end
	_M.res = post('crm.item.list',{['entityTypeId']=entityTypeId,['select']=sel,['filter']=filter,['order']=order,['useOriginalUfNames']=useOriginalUfNames,['start']=start},true)
	array.merge(_M.listing,_M.res.result)
	if _M.res.next then 
		start = tonumber(_M.res.next)
		_M.item.list(entityTypeId,sel,fields,filter,order,useOriginalUfNames,start)
	end	
	return _M.listing
end

--[[ 
	Deals
--]]

-- https://apidocs.bitrix24.ru/api-reference/crm/deals/crm-deal-get.html

function _M.deal.get(id)
	return post('crm.deal.get',{['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/deals/crm-deal-list.html

function _M.deal.list(sel,filter,order,start)
	sel = sel or {'*'}
	if not start then 
		_M.listing = {} 
		start = 0
	end
	_M.res = post('crm.deal.list',{['select']=sel,['filter']=filter,['order']=order,['start']=start},true)
	array.merge(_M.listing,_M.res.result)
	if _M.res.next then 
		start = tonumber(_M.res.next)
		_M.deal.list(sel,filter,order,start)
	end	
	return _M.listing
end

-- https://apidocs.bitrix24.ru/api-reference/crm/deals/crm-deal-add.html

function _M.deal.add(fields)
	return post('crm.deal.add',{['fields']=fields})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/deals/crm-deal-update.html

function _M.deal.update(id,fields)
	return post('crm.deal.update',{['id']=id,['fields']=fields})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/deals/crm-deal-delete.html

function _M.deal.delete(id)
	return post('crm.deal.delete',{['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/deals/crm-deal-fields.html

function _M.deal.fields()
	return post('crm.deal.fields',{})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/deals/crm-deal-productrows-get.html

function _M.deal.productrows.get(id)
	return post('crm.deal.productrows.get',{['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/deals/crm-deal-productrows-set.html

function _M.deal.productrows.set(id,rows)
	return post('crm.deal.productrows.set',{['id']=id,['rows']=rows})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/deals/user-defined-fields/crm-deal-userfield-get.html

function _M.deal.userfield.get(id)
	return post('crm.deal.userfield.get',{['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/deals/user-defined-fields/crm-deal-userfield-add.html

function _M.deal.userfield.add(fields)
	return post('crm.deal.userfield.add',{['fields']=fields})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/deals/user-defined-fields/crm-deal-userfield-delete.html

function _M.deal.userfield.delete(id)
	return post('crm.deal.userfield.delete',{['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/deals/user-defined-fields/crm-deal-userfield-update.html

function _M.deal.userfield.update(id,fields,LIST)
	return post('crm.deal.userfield.update',{['id']=id,['fields']=fields,['LIST']=LIST})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/deals/user-defined-fields/crm-deal-userfield-list.html

function _M.deal.userfield.list(order,filter)
	return post('crm.deal.userfield.list',{['order']=order,['filter']=filter})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/deals/contacts/crm-deal-contact-add.html

function _M.deal.contact.add(id,fields)
	return post('crm.deal.contact.add',{['id']=id,['fields']=fields})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/deals/contacts/crm-deal-contact-delete.html

function _M.deal.contact.delete(id,contact_id)
	return post('crm.deal.contact.delete',{['id']=id,['fields']={['CONTACT_ID']=contact_id}})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/deals/contacts/crm-deal-contact-items-set.html

function _M.deal.contact.items.set(id,items)
	return post('crm.deal.contact.items.set',{['id']=id,['items']=items})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/deals/contacts/crm-deal-contact-items-get.html

function _M.deal.contact.items.get(id)
	return post('crm.deal.contact.items.get',{['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/deals/contacts/crm-deal-contact-items-delete.html

function _M.deal.contact.items.delete(id)
	return post('crm.deal.contact.items.delete',{['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/deals/recurring-deals/crm-deal-recurring-get.html

function _M.deal.recurring.get(id)
	return post('crm.deal.recurring.get',{['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/deals/recurring-deals/crm-deal-recurring-add.html

function _M.deal.recurring.add(fields)
	return post('crm.deal.recurring.add',{['fields']=fields})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/deals/recurring-deals/crm-deal-recurring-delete.html

function _M.deal.recurring.delete(id)
	return post('crm.deal.recurring.delete',{['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/deals/recurring-deals/crm-deal-recurring-fields.html

function _M.deal.recurring.fields()
	return post('crm.deal.recurring.fields',{})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/deals/recurring-deals/crm-deal-recurring-update.html

function _M.deal.recurring.update(id,fields)
	return post('crm.deal.recurring.update',{['id']=id,['fields']=fields})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/deals/recurring-deals/crm-deal-recurring-list.html

function _M.deal.recurring.list(order,filter,sel)
	return post('crm.deal.recurring.list',{['order']=order,['filter']=filter,['select']=sel})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/deals/recurring-deals/crm-deal-recurring-expose.html

function _M.deal.recurring.expose(id)
	return post('crm.deal.recurring.expose',{['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/deals/custom-form/crm-deal-details-configuration-get.html

function _M.deal.details.configuration.get(scope,userId,extras)
	return post('crm.deal.details.configuration.get',{['scope']=id,['userId']=userId,['extras']=extras})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/deals/custom-form/crm-deal-details-configuration-reset.html

function _M.deal.details.configuration.reset(scope,userId,extras)
	return post('crm.deal.details.configuration.reset',{['scope']=id,['userId']=userId,['extras']=extras})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/deals/custom-form/crm-deal-details-configuration-set.html

function _M.deal.details.configuration.set(scope,userId,data,extras)
	return post('crm.deal.details.configuration.set',{['scope']=id,['userId']=userId,['data']=data,['extras']=extras})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/deals/custom-form/crm-deal-details-configuration-force-common-scope-for-all.html

function _M.deal.details.configuration.forceCommonScopeForAll(extras)
	return post('crm.deal.details.configuration.forceCommonScopeForAll',{['extras']=extras})
end

--[[ 
	Statuses
--]]

-- https://apidocs.bitrix24.ru/api-reference/crm/status/crm-status-get.html

function _M.status.get(id)
	return post('crm.status.get',{['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/status/crm-status-add.html

function _M.status.add(fields)
	return post('crm.status.add',{['fields']=fields})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/status/crm-status-delete.html

function _M.status.delete(id)
	return post('crm.status.delete',{['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/status/crm-status-fields.html

function _M.status.fields()
	return post('crm.status.fields',{})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/status/crm-status-update.html

function _M.status.update(id,fields)
	return post('crm.status.update',{['id']=id,['fields']=fields})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/status/crm-status-list.html

function _M.status.list(order,filter)
	return post('crm.status.list',{['order']=order,['filter']=filter})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/status/crm-status-entity-items.html

function _M.status.entity.items(entityId)
	return post('crm.status.entity.items',{['entityId']=entityId})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/status/crm-status-entity-types.html

function _M.status.entity.types()
	return post('crm.status.entity.types',{})
end

--[[ 
	Categories
--]]

-- https://apidocs.bitrix24.ru/api-reference/crm/universal/category/crm-category-get.html

function _M.category.get(entityTypeId,id)
	return post('crm.category.get',{['entityTypeId']=entityTypeId,['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/universal/category/crm-category-add.html

function _M.category.add(entityTypeId,fields)
	return post('crm.category.add',{['entityTypeId']=entityTypeId,['fields']=fields})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/universal/category/crm-category-add.html

function _M.category.update(entityTypeId,id,fields)
	return post('crm.category.update',{['entityTypeId']=entityTypeId,['id']=id,['fields']=fields})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/universal/category/crm-category-delete.html

function _M.category.delete(entityTypeId,id)
	return post('crm.category.delete',{['entityTypeId']=entityTypeId,['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/universal/category/crm-category-fields.html

function _M.category.fields(entityTypeId)
	return post('crm.category.fields',{['entityTypeId']=entityTypeId})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/universal/category/crm-category-update.html

function _M.category.update(entityTypeId,id,fields)
	return post('crm.category.update',{['entityTypeId']=entityTypeId,['id']=id,['fields']=fields})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/universal/category/crm-category-list.html

function _M.category.list(entityTypeId)
	return post('crm.category.list',{['entityTypeId']=entityTypeId})
end

return _M
