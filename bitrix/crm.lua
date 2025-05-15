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
_M.lead = {}
_M.lead.productrows = {}
_M.lead.contact = {}
_M.lead.contact.items = {}
_M.lead.userfield = {}
_M.lead.details = {}
_M.lead.details.configuration = {}
_M.contact = {}
_M.contact.productrows = {}
_M.contact.company = {}
_M.contact.company.items = {}
_M.contact.userfield = {}
_M.contact.details = {}
_M.contact.details.configuration = {}
_M.company = {}
_M.company.productrows = {}
_M.company.userfield = {}
_M.company.contact = {}
_M.company.contact.items = {}
_M.company.contact.item = {}
_M.company.details = {}
_M.company.details.configuration = {}
_M.timeline = {}
_M.timeline.comment = {}
_M.timeline.note= {}
_M.timeline.bindings = {}
_M.timeline.layout = {}
_M.timeline.item = {}
_M.timeline.logmessage = {}
_M.quote = {}
_M.quote.productrows = {}
_M.quote.userfield = {}
_M.address = {}
_M.requisite = {}
_M.requisite.bankdetail = {}
_M.requisite.userfield = {}
_M.requisite.link = {}
_M.requisite.preset = {}
_M.requisite.preset.field = {}
_M.multifield = {}
_M.enum = {}
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

function _M.post(url,data,full)
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
	return _M.post('crm.item.fields',{['entityTypeId']=entityTypeId,['useOriginalUfNames']=useOriginalUfNames})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/universal/crm-item-add.html

function _M.item.add(entityTypeId,fields,useOriginalUfNames)
	return _M.post('crm.item.add',{['entityTypeId']=entityTypeId,['fields']=fields,['useOriginalUfNames']=useOriginalUfNames})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/universal/crm-item-update.html

function _M.item.update(entityTypeId,id,fields,useOriginalUfNames)
	return _M.post('crm.item.update',{['entityTypeId']=entityTypeId,['id']=id,['fields']=fields,['useOriginalUfNames']=useOriginalUfNames})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/universal/crm-item-delete.html

function _M.item.delete(entityTypeId,id)
	return _M.post('crm.item.delete',{['entityTypeId']=entityTypeId,['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/universal/crm-item-list.html

function _M.item.list(entityTypeId,sel,fields,filter,order,useOriginalUfNames,start)
	sel = sel or {'*'}
	if not start then 
		_M.listing = {} 
		start = 0
	end
	_M.res = _M.post('crm.item.list',{['entityTypeId']=entityTypeId,['select']=sel,['filter']=filter,['order']=order,['useOriginalUfNames']=useOriginalUfNames,['start']=start},true)
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
	return _M.post('crm.deal.get',{['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/deals/crm-deal-list.html

function _M.deal.list(sel,filter,order,start)
	sel = sel or {'*'}
	if not start then 
		_M.listing = {} 
		start = 0
	end
	_M.res = _M.post('crm.deal.list',{['select']=sel,['filter']=filter,['order']=order,['start']=start},true)
	array.merge(_M.listing,_M.res.result)
	if _M.res.next then 
		start = tonumber(_M.res.next)
		_M.deal.list(sel,filter,order,start)
	end	
	return _M.listing
end

-- https://apidocs.bitrix24.ru/api-reference/crm/deals/crm-deal-add.html

function _M.deal.add(fields)
	return _M.post('crm.deal.add',{['fields']=fields})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/deals/crm-deal-update.html

function _M.deal.update(id,fields)
	return _M.post('crm.deal.update',{['id']=id,['fields']=fields})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/deals/crm-deal-delete.html

function _M.deal.delete(id)
	return _M.post('crm.deal.delete',{['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/deals/crm-deal-fields.html

function _M.deal.fields()
	return _M.post('crm.deal.fields',{})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/deals/crm-deal-productrows-get.html

function _M.deal.productrows.get(id)
	return _M.post('crm.deal.productrows.get',{['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/deals/crm-deal-productrows-set.html

function _M.deal.productrows.set(id,rows)
	return _M.post('crm.deal.productrows.set',{['id']=id,['rows']=rows})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/deals/user-defined-fields/crm-deal-userfield-get.html

function _M.deal.userfield.get(id)
	return _M.post('crm.deal.userfield.get',{['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/deals/user-defined-fields/crm-deal-userfield-add.html

function _M.deal.userfield.add(fields)
	return _M.post('crm.deal.userfield.add',{['fields']=fields})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/deals/user-defined-fields/crm-deal-userfield-delete.html

function _M.deal.userfield.delete(id)
	return _M.post('crm.deal.userfield.delete',{['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/deals/user-defined-fields/crm-deal-userfield-update.html

function _M.deal.userfield.update(id,fields,LIST)
	return _M.post('crm.deal.userfield.update',{['id']=id,['fields']=fields,['LIST']=LIST})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/deals/user-defined-fields/crm-deal-userfield-list.html

function _M.deal.userfield.list(order,filter)
	return _M.post('crm.deal.userfield.list',{['order']=order,['filter']=filter})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/deals/contacts/crm-deal-contact-add.html

function _M.deal.contact.add(id,fields)
	return _M.post('crm.deal.contact.add',{['id']=id,['fields']=fields})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/deals/contacts/crm-deal-contact-delete.html

function _M.deal.contact.delete(id,contact_id)
	return _M.post('crm.deal.contact.delete',{['id']=id,['fields']={['CONTACT_ID']=contact_id}})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/deals/contacts/crm-deal-contact-items-set.html

function _M.deal.contact.items.set(id,items)
	return _M.post('crm.deal.contact.items.set',{['id']=id,['items']=items})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/deals/contacts/crm-deal-contact-items-get.html

function _M.deal.contact.items.get(id)
	return _M.post('crm.deal.contact.items.get',{['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/deals/contacts/crm-deal-contact-items-delete.html

function _M.deal.contact.items.delete(id)
	return _M.post('crm.deal.contact.items.delete',{['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/deals/recurring-deals/crm-deal-recurring-get.html

function _M.deal.recurring.get(id)
	return _M.post('crm.deal.recurring.get',{['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/deals/recurring-deals/crm-deal-recurring-add.html

function _M.deal.recurring.add(fields)
	return _M.post('crm.deal.recurring.add',{['fields']=fields})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/deals/recurring-deals/crm-deal-recurring-delete.html

function _M.deal.recurring.delete(id)
	return _M.post('crm.deal.recurring.delete',{['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/deals/recurring-deals/crm-deal-recurring-fields.html

function _M.deal.recurring.fields()
	return _M.post('crm.deal.recurring.fields',{})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/deals/recurring-deals/crm-deal-recurring-update.html

function _M.deal.recurring.update(id,fields)
	return _M.post('crm.deal.recurring.update',{['id']=id,['fields']=fields})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/deals/recurring-deals/crm-deal-recurring-list.html

function _M.deal.recurring.list(order,filter,sel)
	return _M.post('crm.deal.recurring.list',{['order']=order,['filter']=filter,['select']=sel})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/deals/recurring-deals/crm-deal-recurring-expose.html

function _M.deal.recurring.expose(id)
	return _M.post('crm.deal.recurring.expose',{['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/deals/custom-form/crm-deal-details-configuration-get.html

function _M.deal.details.configuration.get(scope,userId,extras)
	return _M.post('crm.deal.details.configuration.get',{['scope']=id,['userId']=userId,['extras']=extras})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/deals/custom-form/crm-deal-details-configuration-reset.html

function _M.deal.details.configuration.reset(scope,userId,extras)
	return _M.post('crm.deal.details.configuration.reset',{['scope']=id,['userId']=userId,['extras']=extras})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/deals/custom-form/crm-deal-details-configuration-set.html

function _M.deal.details.configuration.set(scope,userId,data,extras)
	return _M.post('crm.deal.details.configuration.set',{['scope']=id,['userId']=userId,['data']=data,['extras']=extras})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/deals/custom-form/crm-deal-details-configuration-force-common-scope-for-all.html

function _M.deal.details.configuration.forceCommonScopeForAll(extras)
	return _M.post('crm.deal.details.configuration.forceCommonScopeForAll',{['extras']=extras})
end

--[[
	Leads
--]]

-- https://apidocs.bitrix24.ru/api-reference/crm/leads/crm-lead-get.html

function _M.lead.get(id)
	return _M.post('crm.lead.get',{['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/leads/crm-lead-list.html

function _M.lead.list(sel,filter,order,start)
	sel = sel or {'*'}
	if not start then 
		_M.listing = {} 
		start = 0
	end
	_M.res = _M.post('crm.lead.list',{['select']=sel,['filter']=filter,['order']=order,['start']=start},true)
	array.merge(_M.listing,_M.res.result)
	if _M.res.next then 
		start = tonumber(_M.res.next)
		_M.lead.list(sel,filter,order,start)
	end	
	return _M.listing
end

-- https://apidocs.bitrix24.ru/api-reference/crm/leads/crm-lead-add.html

function _M.lead.add(fields)
	return _M.post('crm.lead.add',{['fields']=fields})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/leads/crm-lead-update.html

function _M.lead.update(id,fields,params)
	return _M.post('crm.lead.update',{['id']=id,['fields']=fields,['params']=params})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/leads/crm-lead-delete.html

function _M.lead.delete(id)
	return _M.post('crm.lead.delete',{['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/leads/crm-lead-fields.html

function _M.lead.fields()
	return _M.post('crm.lead.fields',{})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/leads/crm-lead-get.html

function _M.lead.productrows.get(id)
	return _M.post('crm.lead.productrows.get',{['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/leads/crm-lead-productrows-set.html

function _M.lead.productrows.set(id,rows)
	return _M.post('crm.lead.productrows.set',{['id']=id,['rows']=rows})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/leads/userfield/crm-lead-userfield-get.html

function _M.lead.userfield.get(id)
	return _M.post('crm.lead.userfield.get',{['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/leads/userfield/crm-lead-userfield-add.html

function _M.lead.userfield.add(fields,LIST)
	return _M.post('crm.lead.userfield.add',{['fields']=fields,['LIST']=LIST})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/leads/userfield/crm-lead-userfield-delete.html

function _M.lead.userfield.delete(id)
	return _M.post('crm.lead.userfield.delete',{['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/leads/userfield/crm-lead-userfield-update.html

function _M.lead.userfield.update(id,fields,LIST)
	return _M.post('crm.lead.userfield.update',{['id']=id,['fields']=fields,['LIST']=LIST})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/leads/userfield/crm-lead-userfield-list.html

function _M.lead.userfield.list(order,filter)
	return _M.post('crm.lead.userfield.list',{['order']=order,['filter']=filter})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/leads/management-communication/crm-lead-contact-add.html

function _M.lead.contact.add(id,fields)
	return _M.post('crm.lead.contact.add',{['id']=id,['fields']=fields})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/leads/management-communication/crm-lead-contact-fields.html

function _M.lead.contact.fields()
	return _M.post('crm.lead.contact.fields',{})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/leads/management-communication/crm-lead-contact-delete.html

function _M.lead.contact.delete(id,contact_id)
	return _M.post('crm.lead.contact.delete',{['id']=id,['fields']={['CONTACT_ID']=contact_id}})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/leads/management-communication/crm-lead-contact-items-set.html

function _M.lead.contact.items.set(id,items)
	return _M.post('crm.lead.contact.items.set',{['id']=id,['items']=items})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/leads/management-communication/crm-lead-contact-items-get.html

function _M.lead.contact.items.get(id)
	return _M.post('crm.lead.contact.items.get',{['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/leads/management-communication/crm-lead-contact-items-delete.html

function _M.lead.contact.items.delete(id)
	return _M.post('crm.lead.contact.items.delete',{['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/leads/custom-form/crm-lead-details-configuration-get.html

function _M.lead.details.configuration.get(scope,userId,extras)
	return _M.post('crm.lead.details.configuration.get',{['scope']=id,['userId']=userId,['extras']=extras})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/leads/custom-form/crm-lead-details-configuration-reset.html

function _M.lead.details.configuration.reset(scope,userId,extras)
	return _M.post('crm.lead.details.configuration.reset',{['scope']=id,['userId']=userId,['extras']=extras})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/leads/custom-form/crm-lead-details-configuration-set.html

function _M.lead.details.configuration.set(scope,userId,data,extras)
	return _M.post('crm.lead.details.configuration.set',{['scope']=id,['userId']=userId,['data']=data,['extras']=extras})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/leads/custom-form/crm-lead-details-configuration-force-common-scope-for-all.html

function _M.lead.details.configuration.forceCommonScopeForAll(extras)
	return _M.post('crm.lead.details.configuration.forceCommonScopeForAll',{['extras']=extras})
end

--[[
	Contacts
--]]

-- https://apidocs.bitrix24.ru/api-reference/crm/contacts/crm-contact-get.html

function _M.contact.get(id)
	return _M.post('crm.contact.get',{['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/contacts/crm-contact-list.html

function _M.contact.list(sel,filter,order,start)
	sel = sel or {'*'}
	if not start then 
		_M.listing = {} 
		start = 0
	end
	_M.res = _M.post('crm.contact.list',{['select']=sel,['filter']=filter,['order']=order,['start']=start},true)
	array.merge(_M.listing,_M.res.result)
	if _M.res.next then 
		start = tonumber(_M.res.next)
		_M.contact.list(sel,filter,order,start)
	end	
	return _M.listing
end

-- https://apidocs.bitrix24.ru/api-reference/crm/contacts/crm-contact-add.html

function _M.contact.add(fields)
	return _M.post('crm.contact.add',{['fields']=fields})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/contacts/crm-contact-update.html

function _M.contact.update(id,fields,params)
	return _M.post('crm.contact.update',{['id']=id,['fields']=fields,['params']=params})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/contacts/crm-contact-delete.html

function _M.contact.delete(id)
	return _M.post('crm.contact.delete',{['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/contacts/crm-contact-fields.html

function _M.contact.fields()
	return _M.post('crm.contact.fields',{})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/contacts/userfield/crm-contact-userfield-get.html

function _M.contact.userfield.get(id)
	return _M.post('crm.contact.userfield.get',{['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/contacts/userfield/crm-contact-userfield-add.html

function _M.contact.userfield.add(fields,LIST)
	return _M.post('crm.contact.userfield.add',{['fields']=fields,['LIST']=LIST})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/contacts/userfield/crm-contact-userfield-delete.html

function _M.contact.userfield.delete(id)
	return _M.post('crm.contact.userfield.delete',{['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/contacts/userfield/crm-contact-userfield-update.html

function _M.contact.userfield.update(id,fields,LIST)
	return _M.post('crm.contact.userfield.update',{['id']=id,['fields']=fields,['LIST']=LIST})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/contacts/userfield/crm-contact-userfield-list.html

function _M.contact.userfield.list(order,filter)
	return _M.post('crm.contact.userfield.list',{['order']=order,['filter']=filter})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/contacts/company/crm-contact-company-add.html

function _M.contact.company.add(id,fields)
	return _M.post('crm.contact.company.add',{['id']=id,['fields']=fields})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/contacts/company/crm-contact-company-fields.html

function _M.contact.company.fields()
	return _M.post('crm.contact.company.fields',{})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/contacts/company/crm-contact-company-delete.html

function _M.contact.company.delete(id,company_id)
	return _M.post('crm.contact.company.delete',{['id']=id,['fields']={['COMPANY_ID']=company_id}})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/contacts/company/crm-contact-company-items-set.html

function _M.contact.company.items.set(id,items)
	return _M.post('crm.contact.company.items.set',{['id']=id,['items']=items})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/contacts/company/crm-contact-company-items-get.html

function _M.contact.company.items.get(id)
	return _M.post('crm.contact.company.items.get',{['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/contacts/company/crm-contact-company-items-delete.html

function _M.contact.company.items.delete(id)
	return _M.post('crm.contact.company.items.delete',{['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/contacts/custom-form/crm-contact-details-configuration-get.html

function _M.contact.details.configuration.get(scope,userId,extras)
	return _M.post('crm.contact.details.configuration.get',{['scope']=id,['userId']=userId,['extras']=extras})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/contacts/custom-form/crm-contact-details-configuration-reset.html

function _M.contact.details.configuration.reset(scope,userId,extras)
	return _M.post('crm.contact.details.configuration.reset',{['scope']=id,['userId']=userId,['extras']=extras})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/contacts/custom-form/crm-contact-details-configuration-set.html

function _M.contact.details.configuration.set(scope,userId,data,extras)
	return _M.post('crm.contact.details.configuration.set',{['scope']=id,['userId']=userId,['data']=data,['extras']=extras})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/contacts/custom-form/crm-contact-details-configuration-force-common-scope-for-all.html

function _M.contact.details.configuration.forceCommonScopeForAll(extras)
	return _M.post('crm.contact.details.configuration.forceCommonScopeForAll',{['extras']=extras})
end

--[[ 
	Companies
--]]

-- https://apidocs.bitrix24.ru/api-reference/crm/companies/crm-company-get.html

function _M.company.get(id)
	return _M.post('crm.company.get',{['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/companies/crm-company-list.html

function _M.company.list(sel,filter,order,start)
	sel = sel or {'*'}
	if not start then 
		_M.listing = {} 
		start = 0
	end
	_M.res = _M.post('crm.company.list',{['select']=sel,['filter']=filter,['order']=order,['start']=start},true)
	array.merge(_M.listing,_M.res.result)
	if _M.res.next then 
		start = tonumber(_M.res.next)
		_M.company.list(sel,filter,order,start)
	end	
	return _M.listing
end

-- https://apidocs.bitrix24.ru/api-reference/crm/companies/crm-company-add.html

function _M.company.add(fields)
	return _M.post('crm.company.add',{['fields']=fields})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/companies/crm-company-update.html

function _M.company.update(id,fields,params)
	return _M.post('crm.company.update',{['id']=id,['fields']=fields,['params']=params})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/companies/crm-company-delete.html

function _M.company.delete(id)
	return _M.post('crm.company.delete',{['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/companies/crm-company-fields.html

function _M.company.fields()
	return _M.post('crm.company.fields',{})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/companies/userfields/crm-company-userfield-get.html

function _M.company.userfield.get(id)
	return _M.post('crm.company.userfield.get',{['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/companies/userfields/crm-company-userfield-add.html

function _M.company.userfield.add(fields,LIST)
	return _M.post('crm.company.userfield.add',{['fields']=fields,['LIST']=LIST})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/companies/userfields/crm-company-userfield-delete.html

function _M.company.userfield.delete(id)
	return _M.post('crm.company.userfield.delete',{['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/companies/userfields/crm-company-userfield-update.html

function _M.company.userfield.update(id,fields,LIST)
	return _M.post('crm.company.userfield.update',{['id']=id,['fields']=fields,['LIST']=LIST})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/companies/userfields/crm-company-userfield-list.html

function _M.company.userfield.list(order,filter)
	return _M.post('crm.company.userfield.list',{['order']=order,['filter']=filter})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/companies/contacts/crm-company-contact-add.html

function _M.company.contact.add(id,fields)
	return _M.post('crm.company.contact.add',{['id']=id,['fields']=fields})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/companies/contacts/crm-company-contact-fields.html

function _M.company.contact.fields()
	return _M.post('crm.company.contact.fields',{})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/companies/contacts/crm-company-contact-delete.html

function _M.company.contact.delete(id,contact_id)
	return _M.post('crm.company.contact.delete',{['id']=id,['fields']={['CONTACT_ID']=contact_id}})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/companies/contacts/crm-company-contact-items-set.html

function _M.company.contact.items.set(id,items)
	return _M.post('crm.company.contact.items.set',{['id']=id,['items']=items})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/companies/contacts/crm-company-contact-items-get.html

function _M.company.contact.items.get(id)
	return _M.post('crm.company.contact.items.get',{['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/companies/contacts/crm-company-contact-items-delete.html

function _M.company.contact.items.delete(id)
	return _M.post('crm.company.contact.items.delete',{['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/companies/custom-form/crm-company-details-configuration-get.html

function _M.company.details.configuration.get(scope,userId,extras)
	return _M.post('crm.company.details.configuration.get',{['scope']=id,['userId']=userId,['extras']=extras})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/companies/custom-form/crm-company-details-configuration-reset.html

function _M.company.details.configuration.reset(scope,userId,extras)
	return _M.post('crm.company.details.configuration.reset',{['scope']=id,['userId']=userId,['extras']=extras})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/companies/custom-form/crm-company-details-configuration-set.html

function _M.company.details.configuration.set(scope,userId,data,extras)
	return _M.post('crm.company.details.configuration.set',{['scope']=id,['userId']=userId,['data']=data,['extras']=extras})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/companies/custom-form/crm-company-details-configuration-force-common-scope-for-all.html

function _M.company.details.configuration.forceCommonScopeForAll(extras)
	return _M.post('crm.company.details.configuration.forceCommonScopeForAll',{['extras']=extras})
end

--[[ 
	Quotes
--]]

-- https://apidocs.bitrix24.ru/api-reference/crm/quote/crm-quote-get.html

function _M.quote.get(id)
	return _M.post('crm.quote.get',{['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/quote/crm-quote-list.html

function _M.quote.list(sel,filter,order,start)
	sel = sel or {'*'}
	if not start then 
		_M.listing = {} 
		start = 0
	end
	_M.res = _M.post('crm.quote.list',{['select']=sel,['filter']=filter,['order']=order,['start']=start},true)
	array.merge(_M.listing,_M.res.result)
	if _M.res.next then 
		start = tonumber(_M.res.next)
		_M.quote.list(sel,filter,order,start)
	end	
	return _M.listing
end

-- https://apidocs.bitrix24.ru/api-reference/crm/quote/crm-quote-add.html

function _M.quote.add(fields)
	return _M.post('crm.quote.add',{['fields']=fields})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/quote/crm-quote-update.html

function _M.quote.update(id,fields,params)
	return _M.post('crm.quote.update',{['id']=id,['fields']=fields,['params']=params})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/quote/crm-quote-delete.html

function _M.quote.delete(id)
	return _M.post('crm.quote.delete',{['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/quote/crm-quote-fields.html

function _M.quote.fields()
	return _M.post('crm.quote.fields',{})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/quote/user-field/crm-quote-user-field-get.html

function _M.quote.userfield.get(id)
	return _M.post('crm.quote.userfield.get',{['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/quote/user-field/crm-quote-user-field-add.html

function _M.quote.userfield.add(fields)
	return _M.post('crm.quote.userfield.add',{['fields']=fields})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/quote/user-field/crm-quote-user-field-delete.html

function _M.quote.userfield.delete(id)
	return _M.post('crm.quote.userfield.delete',{['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/quote/user-field/crm-quote-user-field-update.html

function _M.quote.userfield.update(id,fields,LIST)
	return _M.post('crm.quote.userfield.update',{['id']=id,['fields']=fields,['LIST']=LIST})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/quote/user-field/crm-quote-user-field-list.html

function _M.quote.userfield.list(order,filter)
	return _M.post('crm.quote.userfield.list',{['order']=order,['filter']=filter})
end

--[[ 
	Addreses
--]]

-- https://apidocs.bitrix24.ru/api-reference/crm/requisites/addresses/crm-address-list.html

function _M.address.list(sel,filter,order,start)
	sel = sel or {'*'}
	if not start then 
		_M.listing = {} 
		start = 0
	end
	_M.res = _M.post('crm.address.list',{['select']=sel,['filter']=filter,['order']=order,['start']=start},true)
	array.merge(_M.listing,_M.res.result)
	if _M.res.next then 
		start = tonumber(_M.res.next)
		_M.address.list(sel,filter,order,start)
	end	
	return _M.listing
end

-- https://apidocs.bitrix24.ru/api-reference/crm/requisites/addresses/crm-address-add.html

function _M.address.add(fields)
	return _M.post('crm.address.add',{['fields']=fields})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/requisites/addresses/crm-address-update.html

function _M.address.update(fields)
	return _M.post('crm.address.update',{['fields']=fields})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/requisites/addresses/crm-address-delete.html

function _M.address.delete(fields)
	return _M.post('crm.address.delete',{['fields']=fields})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/requisites/addresses/crm-address-fields.html

function _M.address.fields()
	return _M.post('crm.address.fields',{})
end

--[[ 
	Requisites
--]]

-- https://apidocs.bitrix24.ru/api-reference/crm/requisites/universal/crm-requisite-get.html

function _M.requisite.get(id)
	return _M.post('crm.requisite.get',{['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/requisites/universal/crm-requisite-list.html

function _M.requisite.list(sel,filter,order,start)
	sel = sel or {'*'}
	if not start then 
		_M.listing = {} 
		start = 0
	end
	_M.res = _M.post('crm.requisite.list',{['select']=sel,['filter']=filter,['order']=order,['start']=start},true)
	array.merge(_M.listing,_M.res.result)
	if _M.res.next then 
		start = tonumber(_M.res.next)
		_M.requisite.list(sel,filter,order,start)
	end	
	return _M.listing
end

-- https://apidocs.bitrix24.ru/api-reference/crm/requisites/universal/crm-requisite-add.html

function _M.requisite.add(fields)
	return _M.post('crm.requisite.add',{['fields']=fields})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/requisites/universal/crm-requisite-update.html

function _M.requisite.update(id,fields,params)
	return _M.post('crm.requisite.update',{['id']=id,['fields']=fields,['params']=params})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/requisites/universal/crm-requisite-delete.html

function _M.requisite.delete(id)
	return _M.post('crm.requisite.delete',{['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/requisites/universal/crm-requisite-fields.html

function _M.requisite.fields()
	return _M.post('crm.requisite.fields',{})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/requisites/bank-detail/crm-requisite-bank-detail-get.html

function _M.requisite.bankdetail.get(id)
	return _M.post('crm.requisite.bankdetail.get',{['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/requisites/bank-detail/crm-requisite-bank-detail-list.html

function _M.requisite.bankdetail.list(sel,filter,order,start)
	sel = sel or {'*'}
	if not start then 
		_M.listing = {} 
		start = 0
	end
	_M.res = _M.post('crm.requisite.bankdetail.list',{['select']=sel,['filter']=filter,['order']=order,['start']=start},true)
	array.merge(_M.listing,_M.res.result)
	if _M.res.next then 
		start = tonumber(_M.res.next)
		_M.requisite.bankdetail.list(sel,filter,order,start)
	end	
	return _M.listing
end

-- https://apidocs.bitrix24.ru/api-reference/crm/requisites/bank-detail/crm-requisite-bank-detail-add.html

function _M.requisite.bankdetail.add(fields)
	return _M.post('crm.requisite.bankdetail.add',{['fields']=fields})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/requisites/bank-detail/crm-requisite-bank-detail-update.html

function _M.requisite.bankdetail.update(id,fields,params)
	return _M.post('crm.requisite.bankdetail.update',{['id']=id,['fields']=fields,['params']=params})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/requisites/bank-detail/crm-requisite-bank-detail-delete.html

function _M.requisite.bankdetail.delete(id)
	return _M.post('crm.requisite.bankdetail.delete',{['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/requisites/bank-detail/crm-requisite-bank-detail-fields.html

function _M.requisite.bankdetail.fields()
	return _M.post('crm.requisite.bankdetail.fields',{})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/requisites/user-fields/crm-requisite-userfield-get.html

function _M.requisite.userfield.get(id)
	return _M.post('crm.requisite.userfield.get',{['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/requisites/user-fields/crm-requisite-userfield-list.html

function _M.requisite.userfield.list(sel,filter,order,start)
	sel = sel or {'*'}
	if not start then 
		_M.listing = {} 
		start = 0
	end
	_M.res = _M.post('crm.requisite.userfield.list',{['select']=sel,['filter']=filter,['order']=order,['start']=start},true)
	array.merge(_M.listing,_M.res.result)
	if _M.res.next then 
		start = tonumber(_M.res.next)
		_M.requisite.userfield.list(sel,filter,order,start)
	end	
	return _M.listing
end

-- https://apidocs.bitrix24.ru/api-reference/crm/requisites/user-fields/crm-requisite-userfield-add.html

function _M.requisite.userfield.add(fields)
	return _M.post('crm.requisite.userfield.add',{['fields']=fields})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/requisites/user-fields/crm-requisite-userfield-update.html

function _M.requisite.userfield.update(id,fields,params)
	return _M.post('crm.requisite.userfield.update',{['id']=id,['fields']=fields,['params']=params})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/requisites/user-fields/crm-requisite-userfield-delete.html

function _M.requisite.userfield.delete(id)
	return _M.post('crm.requisite.userfield.delete',{['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/requisites/links/crm-requisite-link-get.html

function _M.requisite.link.get(entityTypeId,entityId)
	return _M.post('crm.requisite.link.get',{['entityTypeId']=entityTypeId,['entityId']=entityId})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/requisites/links/crm-requisite-link-list.html

function _M.requisite.link.list(sel,filter,order,start)
	sel = sel or {'*'}
	if not start then 
		_M.listing = {} 
		start = 0
	end
	_M.res = _M.post('crm.requisite.link.list',{['select']=sel,['filter']=filter,['order']=order,['start']=start},true)
	array.merge(_M.listing,_M.res.result)
	if _M.res.next then 
		start = tonumber(_M.res.next)
		_M.requisite.link.list(sel,filter,order,start)
	end	
	return _M.listing
end

-- https://apidocs.bitrix24.ru/api-reference/crm/requisites/links/crm-requisite-link-register.html

function _M.requisite.link.register(fields)
	return _M.post('crm.requisite.link.register',{['fields']=fields})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/requisites/links/crm-requisite-link-unregister.html

function _M.requisite.link.unregister(entityTypeId,entityId)
	return _M.post('crm.requisite.link.unregister',{['entityTypeId']=entityTypeId,['entityId']=entityId})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/requisites/links/crm-requisite-link-fields.html

function _M.requisite.link.fields()
	return _M.post('crm.requisite.link.fields',{})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/requisites/presets/crm-requisite-preset-get.html

function _M.requisite.preset.get(id)
	return _M.post('crm.requisite.preset.get',{['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/requisites/presets/crm-requisite-preset-list.html

function _M.requisite.preset.list(sel,filter,order,start)
	sel = sel or {'*'}
	if not start then 
		_M.listing = {} 
		start = 0
	end
	_M.res = _M.post('crm.requisite.preset.list',{['select']=sel,['filter']=filter,['order']=order,['start']=start},true)
	array.merge(_M.listing,_M.res.result)
	if _M.res.next then 
		start = tonumber(_M.res.next)
		_M.requisite.preset.list(sel,filter,order,start)
	end	
	return _M.listing
end

-- https://apidocs.bitrix24.ru/api-reference/crm/requisites/presets/crm-requisite-preset-add.html

function _M.requisite.preset.add(fields)
	return _M.post('crm.requisite.preset.add',{['fields']=fields})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/requisites/presets/crm-requisite-preset-update.html

function _M.requisite.preset.update(id,fields)
	return _M.post('crm.requisite.preset.update',{['id']=id,['fields']=fields})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/requisites/presets/crm-requisite-preset-delete.html

function _M.requisite.preset.delete(id)
	return _M.post('crm.requisite.preset.delete',{['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/requisites/presets/crm-requisite-preset-fields.html

function _M.requisite.preset.fields()
	return _M.post('crm.requisite.preset.fields',{})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/requisites/presets/crm-requisite-preset-countries.html

function _M.requisite.preset.countries()
	return _M.post('crm.requisite.preset.countries',{})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/requisites/presets/fields/crm-requisite-preset-field-get.html

function _M.requisite.preset.field.get(id,preset)
	return _M.post('crm.requisite.preset.field.get',{['id']=id,['preset']=preset})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/requisites/presets/fields/crm-requisite-preset-field-list.html

function _M.requisite.preset.field.list(preset)
	return _M.post('crm.requisite.preset.field.list',{['preset']=preset})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/requisites/presets/fields/crm-requisite-preset-field-add.html

function _M.requisite.preset.field.add(preset,fields)
	return _M.post('crm.requisite.preset.field.add',{['preset']=preset,['fields']=fields})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/requisites/presets/fields/crm-requisite-preset-field-update.html

function _M.requisite.preset.field.update(id,preset,fields)
	return _M.post('crm.requisite.preset.field.update',{['id']=id,['preset']=preset,['fields']=fields})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/requisites/presets/fields/crm-requisite-preset-field-delete.html

function _M.requisite.preset.field.delete(id,preset)
	return _M.post('crm.requisite.preset.field.delete',{['id']=id,['preset']=preset})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/requisites/presets/fields/crm-requisite-preset-field-fields.html

function _M.requisite.preset.field.fields()
	return _M.post('crm.requisite.preset.field.fields',{})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/requisites/presets/fields/crm-requisite-preset-field-available-to-add.html

function _M.requisite.preset.field.availabletoadd(preset)
	return _M.post('crm.requisite.preset.field.availabletoadd',{['preset']=preset})
end

--[[ 
	Multifields
--]]

-- https://apidocs.bitrix24.ru/api-reference/crm/auxiliary/multifield/crm-multifield-fields.html

function _M.multifield.fields()
	return _M.post('crm.multifield.fields',{})
end

--[[ 
	Enums
--]]

-- https://apidocs.bitrix24.ru/api-reference/crm/auxiliary/enum/crm-enum-fields.html

function _M.enum.fields()
	return _M.post('crm.enum.fields',{})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/auxiliary/enum/crm-enum-owner-type.html

function _M.enum.ownertype()
	return _M.post('crm.enum.ownertype',{})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/auxiliary/enum/crm-enum-get-order-owner-types.html

function _M.enum.getorderownertypes()
	return _M.post('crm.enum.getorderownertypes',{})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/auxiliary/enum/crm-enum-content-type.html

function _M.enum.contenttype()
	return _M.post('crm.enum.contenttype',{})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/auxiliary/enum/crm-enum-activity-type.html

function _M.enum.activitytype()
	return _M.post('crm.enum.activitytype',{})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/auxiliary/enum/crm-enum-activity-priority.html

function _M.enum.activitypriority()
	return _M.post('crm.enum.activitypriority',{})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/auxiliary/enum/crm-enum-activity-direction.html

function _M.enum.activivtydirection()
	return _M.post('crm.enum.activivtydirection',{})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/auxiliary/enum/crm-enum-activity-notify-type.html

function _M.enum.activitynotifytype()
	return _M.post('crm.enum.activitynotifytype',{})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/auxiliary/enum/crm-enum-address-type.html

function _M.enum.addresstype()
	return _M.post('crm.enum.addresstype',{})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/auxiliary/enum/crm-enum-activity-status.html

function _M.enum.activitystatus()
	return _M.post('crm.enum.activitystatus',{})
end

--[[ 
	Statuses
--]]

-- https://apidocs.bitrix24.ru/api-reference/crm/status/crm-status-get.html

function _M.status.get(id)
	return _M.post('crm.status.get',{['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/status/crm-status-add.html

function _M.status.add(fields)
	return _M.post('crm.status.add',{['fields']=fields})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/status/crm-status-delete.html

function _M.status.delete(id)
	return _M.post('crm.status.delete',{['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/status/crm-status-fields.html

function _M.status.fields()
	return _M.post('crm.status.fields',{})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/status/crm-status-update.html

function _M.status.update(id,fields)
	return _M.post('crm.status.update',{['id']=id,['fields']=fields})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/status/crm-status-list.html

function _M.status.list(order,filter)
	return _M.post('crm.status.list',{['order']=order,['filter']=filter})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/status/crm-status-entity-items.html

function _M.status.entity.items(entityId)
	return _M.post('crm.status.entity.items',{['entityId']=entityId})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/status/crm-status-entity-types.html

function _M.status.entity.types()
	return _M.post('crm.status.entity.types',{})
end

--[[ 
	Categories
--]]

-- https://apidocs.bitrix24.ru/api-reference/crm/universal/category/crm-category-get.html

function _M.category.get(entityTypeId,id)
	return _M.post('crm.category.get',{['entityTypeId']=entityTypeId,['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/universal/category/crm-category-add.html

function _M.category.add(entityTypeId,fields)
	return _M.post('crm.category.add',{['entityTypeId']=entityTypeId,['fields']=fields})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/universal/category/crm-category-add.html

function _M.category.update(entityTypeId,id,fields)
	return _M.post('crm.category.update',{['entityTypeId']=entityTypeId,['id']=id,['fields']=fields})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/universal/category/crm-category-delete.html

function _M.category.delete(entityTypeId,id)
	return _M.post('crm.category.delete',{['entityTypeId']=entityTypeId,['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/universal/category/crm-category-fields.html

function _M.category.fields(entityTypeId)
	return _M.post('crm.category.fields',{['entityTypeId']=entityTypeId})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/universal/category/crm-category-update.html

function _M.category.update(entityTypeId,id,fields)
	return _M.post('crm.category.update',{['entityTypeId']=entityTypeId,['id']=id,['fields']=fields})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/universal/category/crm-category-list.html

function _M.category.list(entityTypeId)
	return _M.post('crm.category.list',{['entityTypeId']=entityTypeId})
end


--[[ 
	Timelines
--]]

-- https://apidocs.bitrix24.ru/api-reference/crm/timeline/comments/crm-timeline-comment-get.html

function _M.timeline.comment.get(id)
	return _M.post('crm.timeline.comment.get',{['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/timeline/comments/crm-timeline-comment-list.html

function _M.timeline.comment.list(sel,filter,order,start)
	sel = sel or {'*'}
	if not start then 
		_M.listing = {} 
		start = 0
	end
	_M.res = _M.post('crm.timeline.comment.list',{['select']=sel,['filter']=filter,['order']=order,['start']=start},true)
	array.merge(_M.listing,_M.res.result)
	if _M.res.next then 
		start = tonumber(_M.res.next)
		_M.timeline.comment.list(sel,filter,order,start)
	end	
	return _M.listing
end

-- https://apidocs.bitrix24.ru/api-reference/crm/timeline/comments/crm-timeline-comment-add.html

function _M.timeline.comment.add(fields)
	return _M.post('crm.timeline.comment.add',{['fields']=fields})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/timeline/comments/crm-timeline-comment-update.html

function _M.timeline.comment.update(id,fields)
	return _M.post('crm.timeline.comment.update',{['id']=id,['fields']=fields})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/timeline/comments/crm-timeline-comment-delete.html

function _M.timeline.comment.delete(id)
	return _M.post('crm.timeline.comment.delete',{['id']=id})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/timeline/comments/crm-timeline-comment-fields.html

function _M.timeline.comment.fields()
	return _M.post('crm.timeline.comment.fields',{})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/timeline/note/crm-timeline-note-get.html

function _M.timeline.note.get(ownerTypeId,ownerId,itemType,itemId)
	return _M.post('crm.timeline.note.get',{['ownerTypeId']=ownerTypeId,['ownerId']=ownerId,['itemType']=itemType,['itemId']=itemId})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/timeline/note/crm-timeline-note-save.html

function _M.timeline.note.save(ownerTypeId,ownerId,itemType,itemId,text)
	return _M.post('crm.timeline.note.save',{['ownerTypeId']=ownerTypeId,['ownerId']=ownerId,['itemType']=itemType,['itemId']=itemId,['text']=text})
end

-- https://apidocs.bitrix24.ru/api-reference/crm/timeline/note/crm-timeline-note-delete.html

function _M.timeline.note.delete(ownerTypeId,ownerId,itemType,itemId)
	return _M.post('crm.timeline.note.delete',{['ownerTypeId']=ownerTypeId,['ownerId']=ownerId,['itemType']=itemType,['itemId']=itemId})
end

return _M
