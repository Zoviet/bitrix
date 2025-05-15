# Bitrix CRM API Lua SDK 

```local api = require("bitrix.api")```

## Items


### Получить поля элемента crm.item.fields

[crm.item.fields](https://apidocs.bitrix24.ru/api-reference/crm/universal/crm-item-fields.html)

```api.item.fields(entityTypeId,useOriginalUfNames)```


### Создать новый элемент CRM crm.item.add

[crm.item.add](https://apidocs.bitrix24.ru/api-reference/crm/universal/crm-item-add.html)

```api.item.add(entityTypeId,fields,useOriginalUfNames)```


### Обновить элемент crm.item.update

[crm.item.update](https://apidocs.bitrix24.ru/api-reference/crm/universal/crm-item-update.html)

```api.item.update(entityTypeId,id,fields,useOriginalUfNames)```


### Удалить элемент crm.item.delete

[crm.item.delete](https://apidocs.bitrix24.ru/api-reference/crm/universal/crm-item-delete.html)

```api.item.delete(entityTypeId,id)```


### Получить список элементов crm.item.list

[crm.item.list](https://apidocs.bitrix24.ru/api-reference/crm/universal/crm-item-list.html)

```api.item.list(entityTypeId,sel,fields,filter,order,useOriginalUfNames,start)```

## Deals


### Получить сделку по Id crm.deal.get

[crm.deal.get](https://apidocs.bitrix24.ru/api-reference/crm/deals/crm-deal-get.html)

```api.deal.get(id)```


### Получить список сделок crm.deal.list

[crm.deal.list](https://apidocs.bitrix24.ru/api-reference/crm/deals/crm-deal-list.html)

```api.deal.list(sel,filter,order,start)```


### Создать новую сделку crm.deal.add

[crm.deal.add](https://apidocs.bitrix24.ru/api-reference/crm/deals/crm-deal-add.html)

```api.deal.add(fields)```


### Изменить сделку crm.deal.update

[crm.deal.update](https://apidocs.bitrix24.ru/api-reference/crm/deals/crm-deal-update.html)

```api.deal.update(id,fields)```


### Удалить сделку crm.deal.delete

[crm.deal.delete](https://apidocs.bitrix24.ru/api-reference/crm/deals/crm-deal-delete.html)

```api.deal.delete(id)```


### Получить поля сделки crm.deal.fields

[crm.deal.fields](https://apidocs.bitrix24.ru/api-reference/crm/deals/crm-deal-fields.html)

```api.deal.fields()```


### Получить товары сделки crm.deal.productrows.get

[crm.deal.productrows.get](https://apidocs.bitrix24.ru/api-reference/crm/deals/crm-deal-productrows-get.html)

```api.deal.productrows.get(id)```


### Установить товары в сделку crm.deal.productrows.set

[crm.deal.productrows.set](https://apidocs.bitrix24.ru/api-reference/crm/deals/crm-deal-productrows-set.html)

```api.deal.productrows.set(id,rows)```


### Получить пользовательское поле сделок по Id crm.deal.userfield.get

[crm.deal.userfield.get](https://apidocs.bitrix24.ru/api-reference/crm/deals/user-defined-fields/crm-deal-userfield-get.html)

```api.deal.userfield.get(id)```


### Создать новое пользовательское поле для сделок crm.deal.userfield.add

[crm.deal.userfield.add](https://apidocs.bitrix24.ru/api-reference/crm/deals/user-defined-fields/crm-deal-userfield-add.html)

```api.deal.userfield.add(fields)```


### Удалить пользовательское поле сделок crm.deal.userfield.delete

[crm.deal.userfield.delete](https://apidocs.bitrix24.ru/api-reference/crm/deals/user-defined-fields/crm-deal-userfield-delete.html)

```api.deal.userfield.delete(id)```


### Изменить существующее пользовательское поле сделок crm.deal.userfield.update

[crm.deal.userfield.update](https://apidocs.bitrix24.ru/api-reference/crm/deals/user-defined-fields/crm-deal-userfield-update.html)

```api.deal.userfield.update(id,fields,LIST)```


### Получить список пользовательских полей сделок crm.deal.userfield.list

[crm.deal.userfield.list](https://apidocs.bitrix24.ru/api-reference/crm/deals/user-defined-fields/crm-deal-userfield-list.html)

```api.deal.userfield.list(order,filter)```


### Добавить контакт к сделке crm.deal.contact.add

[crm.deal.contact.add](https://apidocs.bitrix24.ru/api-reference/crm/deals/contacts/crm-deal-contact-add.html)

```api.deal.contact.add(id,fields)```


### Удалить контакт из указанной сделки crm.deal.contact.delete

[crm.deal.contact.delete](https://apidocs.bitrix24.ru/api-reference/crm/deals/contacts/crm-deal-contact-delete.html)

```api.deal.contact.delete(id,contact_id)```


### Добавить несколько контактов к сделке crm.deal.contact.items.set

[crm.deal.contact.items.set](https://apidocs.bitrix24.ru/api-reference/crm/deals/contacts/crm-deal-contact-items-set.html)

```api.deal.contact.items.set(id,items)```


### Получить набор контактов, связанных со сделкой crm.deal.contact.items.get

[crm.deal.contact.items.get](https://apidocs.bitrix24.ru/api-reference/crm/deals/contacts/crm-deal-contact-items-get.html)

```api.deal.contact.items.get(id)```


### Удалить набор контактов, связанных с указанной сделкой crm.deal.contact.items.delete

[crm.deal.contact.items.delete](https://apidocs.bitrix24.ru/api-reference/crm/deals/contacts/crm-deal-contact-items-delete.html)

```api.deal.contact.items.delete(id)```


### Получить поля настройки шаблона регулярной сделки по Id crm.deal.recurring.get

[crm.deal.recurring.get](https://apidocs.bitrix24.ru/api-reference/crm/deals/recurring-deals/crm-deal-recurring-get.html)

```api.deal.recurring.get(id)```


### Создать новую регулярную сделку crm.deal.recurring.add

[crm.deal.recurring.add](https://apidocs.bitrix24.ru/api-reference/crm/deals/recurring-deals/crm-deal-recurring-add.html)

```api.deal.recurring.add(fields)```


### Удалить существующую настройку для шаблона регулярной сделки crm.deal.recurring.delete

[crm.deal.recurring.delete](https://apidocs.bitrix24.ru/api-reference/crm/deals/recurring-deals/crm-deal-recurring-delete.html)

```api.deal.recurring.delete(id)```


### Получить список полей шаблона регулярной сделки crm.deal.recurring.fields

[crm.deal.recurring.fields](https://apidocs.bitrix24.ru/api-reference/crm/deals/recurring-deals/crm-deal-recurring-fields.html)

```api.deal.recurring.fields()```


### Изменить существующую настройку для шаблона регулярной сделки crm.deal.recurring.update

[crm.deal.recurring.update](https://apidocs.bitrix24.ru/api-reference/crm/deals/recurring-deals/crm-deal-recurring-update.html)

```api.deal.recurring.update(id,fields)```


### Получить список настроек шаблонов регулярных сделок crm.deal.recurring.list

[crm.deal.recurring.list](https://apidocs.bitrix24.ru/api-reference/crm/deals/recurring-deals/crm-deal-recurring-list.html)

```api.deal.recurring.list(order,filter,sel)```


### Создать новую сделку из шаблона crm.deal.recurring.expose

[crm.deal.recurring.expose](https://apidocs.bitrix24.ru/api-reference/crm/deals/recurring-deals/crm-deal-recurring-expose.html)

```api.deal.recurring.expose(id)```


### Получить параметры карточки crm.deal.details.configuration.get

[crm.deal.details.configuration.get](https://apidocs.bitrix24.ru/api-reference/crm/deals/custom-form/crm-deal-details-configuration-get.html)

```api.deal.details.configuration.get(scope,userId,extras)```


### Сбросить параметры карточки crm.deal.details.configuration.reset

[crm.deal.details.configuration.reset](https://apidocs.bitrix24.ru/api-reference/crm/deals/custom-form/crm-deal-details-configuration-reset.html)

```api.deal.details.configuration.reset(scope,userId,extras)```


### Установить параметры индивидуальной карточки crm.deal.details.configuration.set

[crm.deal.details.configuration.set](https://apidocs.bitrix24.ru/api-reference/crm/deals/custom-form/crm-deal-details-configuration-set.html)

```api.deal.details.configuration.set(scope,userId,data,extras)```


### Установить общую карточку для всех пользователей crm.deal.details.configuration.forceCommonScopeForAll

[crm.deal.details.configuration.forceCommonScopeForAll](https://apidocs.bitrix24.ru/api-reference/crm/deals/custom-form/crm-deal-details-configuration-force-common-scope-for-all.html)

```api.deal.details.configuration.forceCommonScopeForAll(extras)```

## Statuses


### Получить элемент справочника по идентификатору crm.status.get

[crm.status.get](https://apidocs.bitrix24.ru/api-reference/crm/status/crm-status-get.html)

```api.status.get(id)```


### Создать новый элемент справочника crm.status.add

[crm.status.add](https://apidocs.bitrix24.ru/api-reference/crm/status/crm-status-add.html)

```api.status.add(fields)```


### Удалить элемент справочника crm.status.delete

[crm.status.delete](https://apidocs.bitrix24.ru/api-reference/crm/status/crm-status-delete.html)

```api.status.delete(id)```


### Получить описание полей справочника crm.status.fields

[crm.status.fields](https://apidocs.bitrix24.ru/api-reference/crm/status/crm-status-fields.html)

```api.status.fields()```


### Обновить существующий элемент справочника crm.status.update

[crm.status.update](https://apidocs.bitrix24.ru/api-reference/crm/status/crm-status-update.html)

```api.status.update(id,fields)```


### Получить список элементов справочника по фильтру crm.status.list

[crm.status.list](https://apidocs.bitrix24.ru/api-reference/crm/status/crm-status-list.html)

```api.status.list(order,filter)```


### Получить элемент справочника по его символьному идентификатору crm.status.entity.items

[crm.status.entity.items](https://apidocs.bitrix24.ru/api-reference/crm/status/crm-status-entity-items.html)

```api.status.entity.items(entityId)```


### Получить типы справочников crm.status.entity.types

[crm.status.entity.types](https://apidocs.bitrix24.ru/api-reference/crm/status/crm-status-entity-types.html)

```api.status.entity.types()```

## Categories


### Получить воронку по Id crm.category.get

[crm.category.get](https://apidocs.bitrix24.ru/api-reference/crm/universal/category/crm-category-get.html)

```api.category.get(entityTypeId,id)```


### Добавить новую воронку crm.category.add

[crm.category.add](https://apidocs.bitrix24.ru/api-reference/crm/universal/category/crm-category-add.html)

```api.category.add(entityTypeId,fields)```


### Добавить новую воронку crm.category.add

[crm.category.add](https://apidocs.bitrix24.ru/api-reference/crm/universal/category/crm-category-add.html)

```api.category.update(entityTypeId,id,fields)```


### Удалить воронку crm.category.delete

[crm.category.delete](https://apidocs.bitrix24.ru/api-reference/crm/universal/category/crm-category-delete.html)

```api.category.delete(entityTypeId,id)```


### Получить поля воронки crm.category.fields

[crm.category.fields](https://apidocs.bitrix24.ru/api-reference/crm/universal/category/crm-category-fields.html)

```api.category.fields(entityTypeId)```


### Обновить воронку crm.category.update

[crm.category.update](https://apidocs.bitrix24.ru/api-reference/crm/universal/category/crm-category-update.html)

```api.category.update(entityTypeId,id,fields)```


### Получить список воронок crm.category.list

[crm.category.list](https://apidocs.bitrix24.ru/api-reference/crm/universal/category/crm-category-list.html)

```api.category.list(entityTypeId)```

# Bitrix CRM API Lua SDK 

```local crm = require("bitrix.crm")```


```crm.post(url,data,full)```

## Items


#### Получить поля элемента crm.item.fields

[crm.item.fields](https://apidocs.bitrix24.ru/api-reference/crm/universal/crm-item-fields.html)

```crm.item.fields(entityTypeId,useOriginalUfNames)```


#### Создать новый элемент CRM crm.item.add

[crm.item.add](https://apidocs.bitrix24.ru/api-reference/crm/universal/crm-item-add.html)

```crm.item.add(entityTypeId,fields,useOriginalUfNames)```


#### Обновить элемент crm.item.update

[crm.item.update](https://apidocs.bitrix24.ru/api-reference/crm/universal/crm-item-update.html)

```crm.item.update(entityTypeId,id,fields,useOriginalUfNames)```


#### Удалить элемент crm.item.delete

[crm.item.delete](https://apidocs.bitrix24.ru/api-reference/crm/universal/crm-item-delete.html)

```crm.item.delete(entityTypeId,id)```


#### Получить список элементов crm.item.list

[crm.item.list](https://apidocs.bitrix24.ru/api-reference/crm/universal/crm-item-list.html)

```crm.item.list(entityTypeId,sel,fields,filter,order,useOriginalUfNames,start)```

## Deals


#### Получить сделку по Id crm.deal.get

[crm.deal.get](https://apidocs.bitrix24.ru/api-reference/crm/deals/crm-deal-get.html)

```crm.deal.get(id)```


#### Получить список сделок crm.deal.list

[crm.deal.list](https://apidocs.bitrix24.ru/api-reference/crm/deals/crm-deal-list.html)

```crm.deal.list(sel,filter,order,start)```


#### Создать новую сделку crm.deal.add

[crm.deal.add](https://apidocs.bitrix24.ru/api-reference/crm/deals/crm-deal-add.html)

```crm.deal.add(fields)```


#### Изменить сделку crm.deal.update

[crm.deal.update](https://apidocs.bitrix24.ru/api-reference/crm/deals/crm-deal-update.html)

```crm.deal.update(id,fields)```


#### Удалить сделку crm.deal.delete

[crm.deal.delete](https://apidocs.bitrix24.ru/api-reference/crm/deals/crm-deal-delete.html)

```crm.deal.delete(id)```


#### Получить поля сделки crm.deal.fields

[crm.deal.fields](https://apidocs.bitrix24.ru/api-reference/crm/deals/crm-deal-fields.html)

```crm.deal.fields()```


#### Получить товары сделки crm.deal.productrows.get

[crm.deal.productrows.get](https://apidocs.bitrix24.ru/api-reference/crm/deals/crm-deal-productrows-get.html)

```crm.deal.productrows.get(id)```


#### Установить товары в сделку crm.deal.productrows.set

[crm.deal.productrows.set](https://apidocs.bitrix24.ru/api-reference/crm/deals/crm-deal-productrows-set.html)

```crm.deal.productrows.set(id,rows)```


#### Получить пользовательское поле сделок по Id crm.deal.userfield.get

[crm.deal.userfield.get](https://apidocs.bitrix24.ru/api-reference/crm/deals/user-defined-fields/crm-deal-userfield-get.html)

```crm.deal.userfield.get(id)```


#### Создать новое пользовательское поле для сделок crm.deal.userfield.add

[crm.deal.userfield.add](https://apidocs.bitrix24.ru/api-reference/crm/deals/user-defined-fields/crm-deal-userfield-add.html)

```crm.deal.userfield.add(fields)```


#### Удалить пользовательское поле сделок crm.deal.userfield.delete

[crm.deal.userfield.delete](https://apidocs.bitrix24.ru/api-reference/crm/deals/user-defined-fields/crm-deal-userfield-delete.html)

```crm.deal.userfield.delete(id)```


#### Изменить существующее пользовательское поле сделок crm.deal.userfield.update

[crm.deal.userfield.update](https://apidocs.bitrix24.ru/api-reference/crm/deals/user-defined-fields/crm-deal-userfield-update.html)

```crm.deal.userfield.update(id,fields,LIST)```


#### Получить список пользовательских полей сделок crm.deal.userfield.list

[crm.deal.userfield.list](https://apidocs.bitrix24.ru/api-reference/crm/deals/user-defined-fields/crm-deal-userfield-list.html)

```crm.deal.userfield.list(order,filter)```


#### Добавить контакт к сделке crm.deal.contact.add

[crm.deal.contact.add](https://apidocs.bitrix24.ru/api-reference/crm/deals/contacts/crm-deal-contact-add.html)

```crm.deal.contact.add(id,fields)```


#### Удалить контакт из указанной сделки crm.deal.contact.delete

[crm.deal.contact.delete](https://apidocs.bitrix24.ru/api-reference/crm/deals/contacts/crm-deal-contact-delete.html)

```crm.deal.contact.delete(id,contact_id)```


#### Добавить несколько контактов к сделке crm.deal.contact.items.set

[crm.deal.contact.items.set](https://apidocs.bitrix24.ru/api-reference/crm/deals/contacts/crm-deal-contact-items-set.html)

```crm.deal.contact.items.set(id,items)```


#### Получить набор контактов, связанных со сделкой crm.deal.contact.items.get

[crm.deal.contact.items.get](https://apidocs.bitrix24.ru/api-reference/crm/deals/contacts/crm-deal-contact-items-get.html)

```crm.deal.contact.items.get(id)```


#### Удалить набор контактов, связанных с указанной сделкой crm.deal.contact.items.delete

[crm.deal.contact.items.delete](https://apidocs.bitrix24.ru/api-reference/crm/deals/contacts/crm-deal-contact-items-delete.html)

```crm.deal.contact.items.delete(id)```


#### Получить поля настройки шаблона регулярной сделки по Id crm.deal.recurring.get

[crm.deal.recurring.get](https://apidocs.bitrix24.ru/api-reference/crm/deals/recurring-deals/crm-deal-recurring-get.html)

```crm.deal.recurring.get(id)```


#### Создать новую регулярную сделку crm.deal.recurring.add

[crm.deal.recurring.add](https://apidocs.bitrix24.ru/api-reference/crm/deals/recurring-deals/crm-deal-recurring-add.html)

```crm.deal.recurring.add(fields)```


#### Удалить существующую настройку для шаблона регулярной сделки crm.deal.recurring.delete

[crm.deal.recurring.delete](https://apidocs.bitrix24.ru/api-reference/crm/deals/recurring-deals/crm-deal-recurring-delete.html)

```crm.deal.recurring.delete(id)```


#### Получить список полей шаблона регулярной сделки crm.deal.recurring.fields

[crm.deal.recurring.fields](https://apidocs.bitrix24.ru/api-reference/crm/deals/recurring-deals/crm-deal-recurring-fields.html)

```crm.deal.recurring.fields()```


#### Изменить существующую настройку для шаблона регулярной сделки crm.deal.recurring.update

[crm.deal.recurring.update](https://apidocs.bitrix24.ru/api-reference/crm/deals/recurring-deals/crm-deal-recurring-update.html)

```crm.deal.recurring.update(id,fields)```


#### Получить список настроек шаблонов регулярных сделок crm.deal.recurring.list

[crm.deal.recurring.list](https://apidocs.bitrix24.ru/api-reference/crm/deals/recurring-deals/crm-deal-recurring-list.html)

```crm.deal.recurring.list(order,filter,sel)```


#### Создать новую сделку из шаблона crm.deal.recurring.expose

[crm.deal.recurring.expose](https://apidocs.bitrix24.ru/api-reference/crm/deals/recurring-deals/crm-deal-recurring-expose.html)

```crm.deal.recurring.expose(id)```


#### Получить параметры карточки crm.deal.details.configuration.get

[crm.deal.details.configuration.get](https://apidocs.bitrix24.ru/api-reference/crm/deals/custom-form/crm-deal-details-configuration-get.html)

```crm.deal.details.configuration.get(scope,userId,extras)```


#### Сбросить параметры карточки crm.deal.details.configuration.reset

[crm.deal.details.configuration.reset](https://apidocs.bitrix24.ru/api-reference/crm/deals/custom-form/crm-deal-details-configuration-reset.html)

```crm.deal.details.configuration.reset(scope,userId,extras)```


#### Установить параметры индивидуальной карточки crm.deal.details.configuration.set

[crm.deal.details.configuration.set](https://apidocs.bitrix24.ru/api-reference/crm/deals/custom-form/crm-deal-details-configuration-set.html)

```crm.deal.details.configuration.set(scope,userId,data,extras)```


#### Установить общую карточку для всех пользователей crm.deal.details.configuration.forceCommonScopeForAll

[crm.deal.details.configuration.forceCommonScopeForAll](https://apidocs.bitrix24.ru/api-reference/crm/deals/custom-form/crm-deal-details-configuration-force-common-scope-for-all.html)

```crm.deal.details.configuration.forceCommonScopeForAll(extras)```

## Leads


#### Получить лид по Id crm.lead.get

[crm.lead.get](https://apidocs.bitrix24.ru/api-reference/crm/leads/crm-lead-get.html)

```crm.lead.get(id)```


#### Получить список лидов crm.lead.list

[crm.lead.list](https://apidocs.bitrix24.ru/api-reference/crm/leads/crm-lead-list.html)

```crm.lead.list(sel,filter,order,start)```


#### Создать новый лид crm.lead.add

[crm.lead.add](https://apidocs.bitrix24.ru/api-reference/crm/leads/crm-lead-add.html)

```crm.lead.add(fields)```


#### Изменить лид crm.lead.update

[crm.lead.update](https://apidocs.bitrix24.ru/api-reference/crm/leads/crm-lead-update.html)

```crm.lead.update(id,fields,params)```


#### Удалить лид crm.lead.delete

[crm.lead.delete](https://apidocs.bitrix24.ru/api-reference/crm/leads/crm-lead-delete.html)

```crm.lead.delete(id)```


#### Получить поля лида crm.lead.fields

[crm.lead.fields](https://apidocs.bitrix24.ru/api-reference/crm/leads/crm-lead-fields.html)

```crm.lead.fields()```


#### Получить лид по Id crm.lead.get

[crm.lead.get](https://apidocs.bitrix24.ru/api-reference/crm/leads/crm-lead-get.html)

```crm.lead.productrows.get(id)```


#### Добавить товары в лид crm.lead.productrows.set

[crm.lead.productrows.set](https://apidocs.bitrix24.ru/api-reference/crm/leads/crm-lead-productrows-set.html)

```crm.lead.productrows.set(id,rows)```


#### Получить поле по коду crm.lead.userfield.get

[crm.lead.userfield.get](https://apidocs.bitrix24.ru/api-reference/crm/leads/userfield/crm-lead-userfield-get.html)

```crm.lead.userfield.get(id)```


#### Добавить поле crm.lead.userfield.add

[crm.lead.userfield.add](https://apidocs.bitrix24.ru/api-reference/crm/leads/userfield/crm-lead-userfield-add.html)

```crm.lead.userfield.add(fields,LIST)```


#### Удалить поле crm.lead.userfield.delete

[crm.lead.userfield.delete](https://apidocs.bitrix24.ru/api-reference/crm/leads/userfield/crm-lead-userfield-delete.html)

```crm.lead.userfield.delete(id)```


#### Изменить поле crm.lead.userfield.update

[crm.lead.userfield.update](https://apidocs.bitrix24.ru/api-reference/crm/leads/userfield/crm-lead-userfield-update.html)

```crm.lead.userfield.update(id,fields,LIST)```


#### Получить список полей crm.lead.userfield.list

[crm.lead.userfield.list](https://apidocs.bitrix24.ru/api-reference/crm/leads/userfield/crm-lead-userfield-list.html)

```crm.lead.userfield.list(order,filter)```


#### Добавить привязку контакта к лиду crm.lead.contact.add

[crm.lead.contact.add](https://apidocs.bitrix24.ru/api-reference/crm/leads/management-communication/crm-lead-contact-add.html)

```crm.lead.contact.add(id,fields)```


#### Получить поля связи лид-контакт crm.lead.contact.fields

[crm.lead.contact.fields](https://apidocs.bitrix24.ru/api-reference/crm/leads/management-communication/crm-lead-contact-fields.html)

```crm.lead.contact.fields()```


#### Удалить привязку контакта к лиду crm.lead.contact.delete

[crm.lead.contact.delete](https://apidocs.bitrix24.ru/api-reference/crm/leads/management-communication/crm-lead-contact-delete.html)

```crm.lead.contact.delete(id,contact_id)```


#### Прикрепить список контактов к лиду crm.lead.contact.items.set

[crm.lead.contact.items.set](https://apidocs.bitrix24.ru/api-reference/crm/leads/management-communication/crm-lead-contact-items-set.html)

```crm.lead.contact.items.set(id,items)```


#### Получить список связанных контактов crm.lead.contact.items.get

[crm.lead.contact.items.get](https://apidocs.bitrix24.ru/api-reference/crm/leads/management-communication/crm-lead-contact-items-get.html)

```crm.lead.contact.items.get(id)```


#### Удалить список контактов у лида crm.lead.contact.items.delete

[crm.lead.contact.items.delete](https://apidocs.bitrix24.ru/api-reference/crm/leads/management-communication/crm-lead-contact-items-delete.html)

```crm.lead.contact.items.delete(id)```


#### Получить параметры карточки crm.lead.details.configuration.get

[crm.lead.details.configuration.get](https://apidocs.bitrix24.ru/api-reference/crm/leads/custom-form/crm-lead-details-configuration-get.html)

```crm.lead.details.configuration.get(scope,userId,extras)```


#### Сбросить параметры карточки crm.lead.details.configuration.reset

[crm.lead.details.configuration.reset](https://apidocs.bitrix24.ru/api-reference/crm/leads/custom-form/crm-lead-details-configuration-reset.html)

```crm.lead.details.configuration.reset(scope,userId,extras)```


#### Установить параметры индивидуальной карточки crm.lead.details.configuration.set

[crm.lead.details.configuration.set](https://apidocs.bitrix24.ru/api-reference/crm/leads/custom-form/crm-lead-details-configuration-set.html)

```crm.lead.details.configuration.set(scope,userId,data,extras)```


#### Установить общую карточку для всех пользователей crm.lead.details.configuration.forceCommonScopeForAll

[crm.lead.details.configuration.forceCommonScopeForAll](https://apidocs.bitrix24.ru/api-reference/crm/leads/custom-form/crm-lead-details-configuration-force-common-scope-for-all.html)

```crm.lead.details.configuration.forceCommonScopeForAll(extras)```

## Contacts


#### Получить контакт по Id crm.contact.get

[crm.contact.get](https://apidocs.bitrix24.ru/api-reference/crm/contacts/crm-contact-get.html)

```crm.contact.get(id)```


#### Получить список контактов crm.contact.list

[crm.contact.list](https://apidocs.bitrix24.ru/api-reference/crm/contacts/crm-contact-list.html)

```crm.contact.list(sel,filter,order,start)```


#### Создать новый контакт crm.contact.add

[crm.contact.add](https://apidocs.bitrix24.ru/api-reference/crm/contacts/crm-contact-add.html)

```crm.contact.add(fields)```


#### Изменить контакт crm.contact.update

[crm.contact.update](https://apidocs.bitrix24.ru/api-reference/crm/contacts/crm-contact-update.html)

```crm.contact.update(id,fields,params)```


#### Удалить контакт crm.contact.delete

[crm.contact.delete](https://apidocs.bitrix24.ru/api-reference/crm/contacts/crm-contact-delete.html)

```crm.contact.delete(id)```


#### Получить поля контакта crm.contact.fields

[crm.contact.fields](https://apidocs.bitrix24.ru/api-reference/crm/contacts/crm-contact-fields.html)

```crm.contact.fields()```


#### Получить пользовательское поле контактов по Id crm.contact.userfield.get

[crm.contact.userfield.get](https://apidocs.bitrix24.ru/api-reference/crm/contacts/userfield/crm-contact-userfield-get.html)

```crm.contact.userfield.get(id)```


#### Создать пользовательское поле для контактов crm.contact.userfield.add

[crm.contact.userfield.add](https://apidocs.bitrix24.ru/api-reference/crm/contacts/userfield/crm-contact-userfield-add.html)

```crm.contact.userfield.add(fields,LIST)```


#### Удалить пользовательское поле контактов crm.contact.userfield.delete

[crm.contact.userfield.delete](https://apidocs.bitrix24.ru/api-reference/crm/contacts/userfield/crm-contact-userfield-delete.html)

```crm.contact.userfield.delete(id)```


#### Изменить существующее пользовательское поле контактов crm.contact.userfield.update

[crm.contact.userfield.update](https://apidocs.bitrix24.ru/api-reference/crm/contacts/userfield/crm-contact-userfield-update.html)

```crm.contact.userfield.update(id,fields,LIST)```


#### Получить список пользовательских полей контактов crm.contact.userfield.list

[crm.contact.userfield.list](https://apidocs.bitrix24.ru/api-reference/crm/contacts/userfield/crm-contact-userfield-list.html)

```crm.contact.userfield.list(order,filter)```


#### Добавить компанию к указанному контакту crm.contact.company.add

[crm.contact.company.add](https://apidocs.bitrix24.ru/api-reference/crm/contacts/company/crm-contact-company-add.html)

```crm.contact.company.add(id,fields)```


#### Получить поля для связи контакт-компания crm.contact.company.fields

[crm.contact.company.fields](https://apidocs.bitrix24.ru/api-reference/crm/contacts/company/crm-contact-company-fields.html)

```crm.contact.company.fields()```


#### Удалить компанию из указанного контакта crm.contact.company.delete

[crm.contact.company.delete](https://apidocs.bitrix24.ru/api-reference/crm/contacts/company/crm-contact-company-delete.html)

```crm.contact.company.delete(id,company_id)```


#### Установить набор компаний, связанных с указанным контактом crm.contact.company.items.set

[crm.contact.company.items.set](https://apidocs.bitrix24.ru/api-reference/crm/contacts/company/crm-contact-company-items-set.html)

```crm.contact.company.items.set(id,items)```


#### Получить набор компаний, связанных с указанным контактом crm.contact.company.items.get

[crm.contact.company.items.get](https://apidocs.bitrix24.ru/api-reference/crm/contacts/company/crm-contact-company-items-get.html)

```crm.contact.company.items.get(id)```


#### Очистить набор компаний, связанных с указанным контактом crm.contact.company.items.delete

[crm.contact.company.items.delete](https://apidocs.bitrix24.ru/api-reference/crm/contacts/company/crm-contact-company-items-delete.html)

```crm.contact.company.items.delete(id)```


#### Получить параметры карточки crm.contact.details.configuration.get

[crm.contact.details.configuration.get](https://apidocs.bitrix24.ru/api-reference/crm/contacts/custom-form/crm-contact-details-configuration-get.html)

```crm.contact.details.configuration.get(scope,userId,extras)```


#### Сбросить параметры карточки crm.contact.details.configuration.reset

[crm.contact.details.configuration.reset](https://apidocs.bitrix24.ru/api-reference/crm/contacts/custom-form/crm-contact-details-configuration-reset.html)

```crm.contact.details.configuration.reset(scope,userId,extras)```


#### Установить параметры индивидуальной карточки crm.contact.details.configuration.set

[crm.contact.details.configuration.set](https://apidocs.bitrix24.ru/api-reference/crm/contacts/custom-form/crm-contact-details-configuration-set.html)

```crm.contact.details.configuration.set(scope,userId,data,extras)```


#### Установить общую карточку для всех пользователей crm.contact.details.configuration.forceCommonScopeForAll

[crm.contact.details.configuration.forceCommonScopeForAll](https://apidocs.bitrix24.ru/api-reference/crm/contacts/custom-form/crm-contact-details-configuration-force-common-scope-for-all.html)

```crm.contact.details.configuration.forceCommonScopeForAll(extras)```

## Companies


#### Получить информацию о компании crm.company.get

[crm.company.get](https://apidocs.bitrix24.ru/api-reference/crm/companies/crm-company-get.html)

```crm.company.get(id)```


#### Получить список компаний по фильтру crm.company.list

[crm.company.list](https://apidocs.bitrix24.ru/api-reference/crm/companies/crm-company-list.html)

```crm.company.list(sel,filter,order,start)```


#### Создать новую компанию crm.company.add

[crm.company.add](https://apidocs.bitrix24.ru/api-reference/crm/companies/crm-company-add.html)

```crm.company.add(fields)```


#### Обновить существующую компанию crm.company.update

[crm.company.update](https://apidocs.bitrix24.ru/api-reference/crm/companies/crm-company-update.html)

```crm.company.update(id,fields,params)```


#### Удалить компанию crm.company.delete

[crm.company.delete](https://apidocs.bitrix24.ru/api-reference/crm/companies/crm-company-delete.html)

```crm.company.delete(id)```


#### Получить описание полей компании crm.company.fields

[crm.company.fields](https://apidocs.bitrix24.ru/api-reference/crm/companies/crm-company-fields.html)

```crm.company.fields()```


#### Получить пользовательское поле компаний по идентификатору crm.company.userfield.get

[crm.company.userfield.get](https://apidocs.bitrix24.ru/api-reference/crm/companies/userfields/crm-company-userfield-get.html)

```crm.company.userfield.get(id)```


#### Создать новое пользовательское поле для компаний crm.company.userfield.add

[crm.company.userfield.add](https://apidocs.bitrix24.ru/api-reference/crm/companies/userfields/crm-company-userfield-add.html)

```crm.company.userfield.add(fields,LIST)```


#### Удалить пользовательское поле компаний crm.company.userfield.delete

[crm.company.userfield.delete](https://apidocs.bitrix24.ru/api-reference/crm/companies/userfields/crm-company-userfield-delete.html)

```crm.company.userfield.delete(id)```


#### Обновить существующее пользовательское поле компаний crm.company.userfield.update

[crm.company.userfield.update](https://apidocs.bitrix24.ru/api-reference/crm/companies/userfields/crm-company-userfield-update.html)

```crm.company.userfield.update(id,fields,LIST)```


#### Получить список пользовательских полей компаний по фильтру crm.company.userfield.list

[crm.company.userfield.list](https://apidocs.bitrix24.ru/api-reference/crm/companies/userfields/crm-company-userfield-list.html)

```crm.company.userfield.list(order,filter)```


#### Добавить контакт к указанной компании crm.company.contact.add

[crm.company.contact.add](https://apidocs.bitrix24.ru/api-reference/crm/companies/contacts/crm-company-contact-add.html)

```crm.company.contact.add(id,fields)```


#### Получить описание полей для связи компания-контакт crm.company.contact.fields

[crm.company.contact.fields](https://apidocs.bitrix24.ru/api-reference/crm/companies/contacts/crm-company-contact-fields.html)

```crm.company.contact.fields()```


#### Удалить контакт из указанной компании crm.company.contact.delete

[crm.company.contact.delete](https://apidocs.bitrix24.ru/api-reference/crm/companies/contacts/crm-company-contact-delete.html)

```crm.company.contact.delete(id,contact_id)```


#### Установить набор контактов, связанных с указанной компанией crm.company.contact.items.set

[crm.company.contact.items.set](https://apidocs.bitrix24.ru/api-reference/crm/companies/contacts/crm-company-contact-items-set.html)

```crm.company.contact.items.set(id,items)```


#### Получить набор контактов, связанных с указанной компанией crm.company.contact.items.get

[crm.company.contact.items.get](https://apidocs.bitrix24.ru/api-reference/crm/companies/contacts/crm-company-contact-items-get.html)

```crm.company.contact.items.get(id)```


#### Очистить набор контактов, связанных с указанной компанией crm.company.contact.items.delete

[crm.company.contact.items.delete](https://apidocs.bitrix24.ru/api-reference/crm/companies/contacts/crm-company-contact-items-delete.html)

```crm.company.contact.items.delete(id)```


#### Получить параметры карточки crm.company.details.configuration.get

[crm.company.details.configuration.get](https://apidocs.bitrix24.ru/api-reference/crm/companies/custom-form/crm-company-details-configuration-get.html)

```crm.company.details.configuration.get(scope,userId,extras)```


#### Сбросить параметры карточки crm.company.details.configuration.reset

[crm.company.details.configuration.reset](https://apidocs.bitrix24.ru/api-reference/crm/companies/custom-form/crm-company-details-configuration-reset.html)

```crm.company.details.configuration.reset(scope,userId,extras)```


#### Установить параметры индивидуальной карточки crm.company.details.configuration.set

[crm.company.details.configuration.set](https://apidocs.bitrix24.ru/api-reference/crm/companies/custom-form/crm-company-details-configuration-set.html)

```crm.company.details.configuration.set(scope,userId,data,extras)```


#### Установить общую карточку для всех пользователей crm.company.details.configuration.forceCommonScopeForAll

[crm.company.details.configuration.forceCommonScopeForAll](https://apidocs.bitrix24.ru/api-reference/crm/companies/custom-form/crm-company-details-configuration-force-common-scope-for-all.html)

```crm.company.details.configuration.forceCommonScopeForAll(extras)```

## Quotes


#### Получить коммерческое предложение по идентификатору crm.quote.get

[crm.quote.get](https://apidocs.bitrix24.ru/api-reference/crm/quote/crm-quote-get.html)

```crm.quote.get(id)```


#### Получить список предложений по фильтру crm.quote.list

[crm.quote.list](https://apidocs.bitrix24.ru/api-reference/crm/quote/crm-quote-list.html)

```crm.quote.list(sel,filter,order,start)```


#### Добавить коммерческое предложение crm.quote.add

[crm.quote.add](https://apidocs.bitrix24.ru/api-reference/crm/quote/crm-quote-add.html)

```crm.quote.add(fields)```


#### Изменить коммерческое предложение crm.quote.update

[crm.quote.update](https://apidocs.bitrix24.ru/api-reference/crm/quote/crm-quote-update.html)

```crm.quote.update(id,fields,params)```


#### Удалить коммерческое предложение crm.quote.delete

[crm.quote.delete](https://apidocs.bitrix24.ru/api-reference/crm/quote/crm-quote-delete.html)

```crm.quote.delete(id)```


#### Получить поля коммерческого предложения crm.quote.fields

[crm.quote.fields](https://apidocs.bitrix24.ru/api-reference/crm/quote/crm-quote-fields.html)

```crm.quote.fields()```


#### Получить пользовательские поля предложений по идентификатору crm.quote.userfield.get

[crm.quote.userfield.get](https://apidocs.bitrix24.ru/api-reference/crm/quote/user-field/crm-quote-user-field-get.html)

```crm.quote.userfield.get(id)```


#### Создать пользовательское поле для предложений crm.quote.userfield.add

[crm.quote.userfield.add](https://apidocs.bitrix24.ru/api-reference/crm/quote/user-field/crm-quote-user-field-add.html)

```crm.quote.userfield.add(fields)```


#### Удалить пользовательское поле предложений crm.quote.userfield.delete

[crm.quote.userfield.delete](https://apidocs.bitrix24.ru/api-reference/crm/quote/user-field/crm-quote-user-field-delete.html)

```crm.quote.userfield.delete(id)```


#### Изменить пользовательское поле предложений crm.quote.userfield.update

[crm.quote.userfield.update](https://apidocs.bitrix24.ru/api-reference/crm/quote/user-field/crm-quote-user-field-update.html)

```crm.quote.userfield.update(id,fields,LIST)```


#### Получить список пользовательских полей предложений по фильтру crm.quote.userfield.list

[crm.quote.userfield.list](https://apidocs.bitrix24.ru/api-reference/crm/quote/user-field/crm-quote-user-field-list.html)

```crm.quote.userfield.list(order,filter)```

## Addreses


#### Получить список адресов по фильтру crm.address.list

[crm.address.list](https://apidocs.bitrix24.ru/api-reference/crm/requisites/addresses/crm-address-list.html)

```crm.address.list(sel,filter,order,start)```


#### Добавить адрес crm.address.add

[crm.address.add](https://apidocs.bitrix24.ru/api-reference/crm/requisites/addresses/crm-address-add.html)

```crm.address.add(fields)```


#### Изменить адрес реквизита crm.address.update

[crm.address.update](https://apidocs.bitrix24.ru/api-reference/crm/requisites/addresses/crm-address-update.html)

```crm.address.update(fields)```


#### Удалить адрес crm.address.delete

[crm.address.delete](https://apidocs.bitrix24.ru/api-reference/crm/requisites/addresses/crm-address-delete.html)

```crm.address.delete(fields)```


#### Получить описание полей адреса crm.address.fields

[crm.address.fields](https://apidocs.bitrix24.ru/api-reference/crm/requisites/addresses/crm-address-fields.html)

```crm.address.fields()```

## Requisites


#### Получить реквизит по id crm.requisite.get

[crm.requisite.get](https://apidocs.bitrix24.ru/api-reference/crm/requisites/universal/crm-requisite-get.html)

```crm.requisite.get(id)```


#### Получить список реквизитов по фильтру crm.requisite.list

[crm.requisite.list](https://apidocs.bitrix24.ru/api-reference/crm/requisites/universal/crm-requisite-list.html)

```crm.requisite.list(sel,filter,order,start)```


#### Добавить реквизит crm.requisite.add

[crm.requisite.add](https://apidocs.bitrix24.ru/api-reference/crm/requisites/universal/crm-requisite-add.html)

```crm.requisite.add(fields)```


#### Обновить реквизит crm.requisite.update

[crm.requisite.update](https://apidocs.bitrix24.ru/api-reference/crm/requisites/universal/crm-requisite-update.html)

```crm.requisite.update(id,fields,params)```


#### Удалить реквизит и связанные объекты crm.requisite.delete

[crm.requisite.delete](https://apidocs.bitrix24.ru/api-reference/crm/requisites/universal/crm-requisite-delete.html)

```crm.requisite.delete(id)```


#### Получить поля реквизита crm.requisite.fields

[crm.requisite.fields](https://apidocs.bitrix24.ru/api-reference/crm/requisites/universal/crm-requisite-fields.html)

```crm.requisite.fields()```


#### Получить банковский реквизит по id crm.requisite.bankdetail.get

[crm.requisite.bankdetail.get](https://apidocs.bitrix24.ru/api-reference/crm/requisites/bank-detail/crm-requisite-bank-detail-get.html)

```crm.requisite.bankdetail.get(id)```


#### Получить список банковских реквизитов по фильтру crm.requisite.bankdetail.list

[crm.requisite.bankdetail.list](https://apidocs.bitrix24.ru/api-reference/crm/requisites/bank-detail/crm-requisite-bank-detail-list.html)

```crm.requisite.bankdetail.list(sel,filter,order,start)```


#### Создать новый банковский реквизит crm.requisite.bankdetail.add

[crm.requisite.bankdetail.add](https://apidocs.bitrix24.ru/api-reference/crm/requisites/bank-detail/crm-requisite-bank-detail-add.html)

```crm.requisite.bankdetail.add(fields)```


#### Изменить банковский реквизит crm.requisite.bankdetail.update

[crm.requisite.bankdetail.update](https://apidocs.bitrix24.ru/api-reference/crm/requisites/bank-detail/crm-requisite-bank-detail-update.html)

```crm.requisite.bankdetail.update(id,fields,params)```


#### Удалить банковский реквизит crm.requisite.bankdetail.delete

[crm.requisite.bankdetail.delete](https://apidocs.bitrix24.ru/api-reference/crm/requisites/bank-detail/crm-requisite-bank-detail-delete.html)

```crm.requisite.bankdetail.delete(id)```


#### Получить описание полей банковских реквизитов crm.requisite.bankdetail.fields

[crm.requisite.bankdetail.fields](https://apidocs.bitrix24.ru/api-reference/crm/requisites/bank-detail/crm-requisite-bank-detail-fields.html)

```crm.requisite.bankdetail.fields()```


#### Получить пользовательское поле по id crm.requisite.userfield.get

[crm.requisite.userfield.get](https://apidocs.bitrix24.ru/api-reference/crm/requisites/user-fields/crm-requisite-userfield-get.html)

```crm.requisite.userfield.get(id)```


#### Получить список пользовательских полей реквизита по фильтру crm.requisite.userfield.list

[crm.requisite.userfield.list](https://apidocs.bitrix24.ru/api-reference/crm/requisites/user-fields/crm-requisite-userfield-list.html)

```crm.requisite.userfield.list(sel,filter,order,start)```


#### Создать новое пользовательское поле реквизита crm.requisite.userfield.add

[crm.requisite.userfield.add](https://apidocs.bitrix24.ru/api-reference/crm/requisites/user-fields/crm-requisite-userfield-add.html)

```crm.requisite.userfield.add(fields)```


#### Изменить пользовательское поле реквизита crm.requisite.userfield.update

[crm.requisite.userfield.update](https://apidocs.bitrix24.ru/api-reference/crm/requisites/user-fields/crm-requisite-userfield-update.html)

```crm.requisite.userfield.update(id,fields,params)```


#### Удалить пользовательское поле реквизита crm.requisite.userfield.delete

[crm.requisite.userfield.delete](https://apidocs.bitrix24.ru/api-reference/crm/requisites/user-fields/crm-requisite-userfield-delete.html)

```crm.requisite.userfield.delete(id)```


#### Получить связь реквизита с объектом crm.requisite.link.get

[crm.requisite.link.get](https://apidocs.bitrix24.ru/api-reference/crm/requisites/links/crm-requisite-link-get.html)

```crm.requisite.link.get(entityTypeId,entityId)```


#### Получить список связей реквизитов crm.requisite.link.list

[crm.requisite.link.list](https://apidocs.bitrix24.ru/api-reference/crm/requisites/links/crm-requisite-link-list.html)

```crm.requisite.link.list(sel,filter,order,start)```


#### Зарегистрировать связь реквизитов с объектом crm.requisite.link.register

[crm.requisite.link.register](https://apidocs.bitrix24.ru/api-reference/crm/requisites/links/crm-requisite-link-register.html)

```crm.requisite.link.register(fields)```


#### Удалить связь реквизита с объектом crm.requisite.link.unregister

[crm.requisite.link.unregister](https://apidocs.bitrix24.ru/api-reference/crm/requisites/links/crm-requisite-link-unregister.html)

```crm.requisite.link.unregister(entityTypeId,entityId)```


#### Получить описание полей связи реквизитов crm.requisite.link.fields

[crm.requisite.link.fields](https://apidocs.bitrix24.ru/api-reference/crm/requisites/links/crm-requisite-link-fields.html)

```crm.requisite.link.fields()```


#### Получить поля шаблона реквизитов по id crm.requisite.preset.get

[crm.requisite.preset.get](https://apidocs.bitrix24.ru/api-reference/crm/requisites/presets/crm-requisite-preset-get.html)

```crm.requisite.preset.get(id)```


#### Получить список шаблонов реквизитов по фильтру crm.requisite.preset.list

[crm.requisite.preset.list](https://apidocs.bitrix24.ru/api-reference/crm/requisites/presets/crm-requisite-preset-list.html)

```crm.requisite.preset.list(sel,filter,order,start)```


#### Создать шаблон crm.requisite.preset.add

[crm.requisite.preset.add](https://apidocs.bitrix24.ru/api-reference/crm/requisites/presets/crm-requisite-preset-add.html)

```crm.requisite.preset.add(fields)```


#### Изменить шаблон реквизита crm.requisite.preset.update

[crm.requisite.preset.update](https://apidocs.bitrix24.ru/api-reference/crm/requisites/presets/crm-requisite-preset-update.html)

```crm.requisite.preset.update(id,fields)```


#### Удалить шаблон реквизита crm.requisite.preset.delete

[crm.requisite.preset.delete](https://apidocs.bitrix24.ru/api-reference/crm/requisites/presets/crm-requisite-preset-delete.html)

```crm.requisite.preset.delete(id)```


#### Получить описание полей шаблона реквизитов crm.requisite.preset.fields

[crm.requisite.preset.fields](https://apidocs.bitrix24.ru/api-reference/crm/requisites/presets/crm-requisite-preset-fields.html)

```crm.requisite.preset.fields()```


#### Получить список стран для шаблона crm.requisite.preset.countries

[crm.requisite.preset.countries](https://apidocs.bitrix24.ru/api-reference/crm/requisites/presets/crm-requisite-preset-countries.html)

```crm.requisite.preset.countries()```


#### Получить настраиваемое поле шаблона реквизитов по id crm.requisite.preset.field.get

[crm.requisite.preset.field.get](https://apidocs.bitrix24.ru/api-reference/crm/requisites/presets/fields/crm-requisite-preset-field-get.html)

```crm.requisite.preset.field.get(id,preset)```


#### Получить список всех настраиваемых полей заданного шаблона реквизитов crm.requisite.preset.field.list

[crm.requisite.preset.field.list](https://apidocs.bitrix24.ru/api-reference/crm/requisites/presets/fields/crm-requisite-preset-field-list.html)

```crm.requisite.preset.field.list(preset)```


#### Добавить настраиваемое поле в шаблон реквизитов crm.requisite.preset.field.add

[crm.requisite.preset.field.add](https://apidocs.bitrix24.ru/api-reference/crm/requisites/presets/fields/crm-requisite-preset-field-add.html)

```crm.requisite.preset.field.add(preset,fields)```


#### Изменить настраиваемое поле заданного шаблона реквизитов crm.requisite.preset.field.update

[crm.requisite.preset.field.update](https://apidocs.bitrix24.ru/api-reference/crm/requisites/presets/fields/crm-requisite-preset-field-update.html)

```crm.requisite.preset.field.update(id,preset,fields)```


#### Удалить настраиваемое поле из шаблона реквизитов crm.requisite.preset.field.delete

[crm.requisite.preset.field.delete](https://apidocs.bitrix24.ru/api-reference/crm/requisites/presets/fields/crm-requisite-preset-field-delete.html)

```crm.requisite.preset.field.delete(id,preset)```


#### Получить описание настраиваемых полей шаблона реквизитов crm.requisite.preset.field.fields

[crm.requisite.preset.field.fields](https://apidocs.bitrix24.ru/api-reference/crm/requisites/presets/fields/crm-requisite-preset-field-fields.html)

```crm.requisite.preset.field.fields()```


#### Получить поля, доступные для добавления в шаблон реквизитов crm.requisite.preset.field.availabletoadd

[crm.requisite.preset.field.availabletoadd](https://apidocs.bitrix24.ru/api-reference/crm/requisites/presets/fields/crm-requisite-preset-field-available-to-add.html)

```crm.requisite.preset.field.availabletoadd(preset)```

## Multifields


#### Получить описание множественных полей crm.multifield.fields

[crm.multifield.fields](https://apidocs.bitrix24.ru/api-reference/crm/auxiliary/multifield/crm-multifield-fields.html)

```crm.multifield.fields()```

## Enums


#### Получить описание полей перечисления crm.enum.fields

[crm.enum.fields](https://apidocs.bitrix24.ru/api-reference/crm/auxiliary/enum/crm-enum-fields.html)

```crm.enum.fields()```


#### Получить элементы перечисления «Тип владельца» crm.enum.ownertype

[crm.enum.ownertype](https://apidocs.bitrix24.ru/api-reference/crm/auxiliary/enum/crm-enum-owner-type.html)

```crm.enum.ownertype()```


#### Получить id объектов, к которым можно привязать заказ crm.enum.getorderownertypes

[crm.enum.getorderownertypes](https://apidocs.bitrix24.ru/api-reference/crm/auxiliary/enum/crm-enum-get-order-owner-types.html)

```crm.enum.getorderownertypes()```


#### Получить элементы перечисления «Тип содержания» crm.enum.contenttype

[crm.enum.contenttype](https://apidocs.bitrix24.ru/api-reference/crm/auxiliary/enum/crm-enum-content-type.html)

```crm.enum.contenttype()```


#### Получить элементы перечисления «Тип активности» crm.enum.activitytype

[crm.enum.activitytype](https://apidocs.bitrix24.ru/api-reference/crm/auxiliary/enum/crm-enum-activity-type.html)

```crm.enum.activitytype()```


#### Получить элементы перечисления «Приоритет активности» crm.enum.activitypriority

[crm.enum.activitypriority](https://apidocs.bitrix24.ru/api-reference/crm/auxiliary/enum/crm-enum-activity-priority.html)

```crm.enum.activitypriority()```


#### Получить элементы перечисления «Направление активности» crm.enum.activivtydirection

[crm.enum.activivtydirection](https://apidocs.bitrix24.ru/api-reference/crm/auxiliary/enum/crm-enum-activity-direction.html)

```crm.enum.activivtydirection()```


#### Получить элементы перечисления «Тип уведомления о начале активности» crm.enum.activitynotifytype

[crm.enum.activitynotifytype](https://apidocs.bitrix24.ru/api-reference/crm/auxiliary/enum/crm-enum-activity-notify-type.html)

```crm.enum.activitynotifytype()```


#### Получить элементы перечисления «Тип адреса» crm.enum.addresstype

[crm.enum.addresstype](https://apidocs.bitrix24.ru/api-reference/crm/auxiliary/enum/crm-enum-address-type.html)

```crm.enum.addresstype()```


#### Получить элементы перечисления «Статус» crm.enum.activitystatus

[crm.enum.activitystatus](https://apidocs.bitrix24.ru/api-reference/crm/auxiliary/enum/crm-enum-activity-status.html)

```crm.enum.activitystatus()```

## Statuses


#### Получить элемент справочника по идентификатору crm.status.get

[crm.status.get](https://apidocs.bitrix24.ru/api-reference/crm/status/crm-status-get.html)

```crm.status.get(id)```


#### Создать новый элемент справочника crm.status.add

[crm.status.add](https://apidocs.bitrix24.ru/api-reference/crm/status/crm-status-add.html)

```crm.status.add(fields)```


#### Удалить элемент справочника crm.status.delete

[crm.status.delete](https://apidocs.bitrix24.ru/api-reference/crm/status/crm-status-delete.html)

```crm.status.delete(id)```


#### Получить описание полей справочника crm.status.fields

[crm.status.fields](https://apidocs.bitrix24.ru/api-reference/crm/status/crm-status-fields.html)

```crm.status.fields()```


#### Обновить существующий элемент справочника crm.status.update

[crm.status.update](https://apidocs.bitrix24.ru/api-reference/crm/status/crm-status-update.html)

```crm.status.update(id,fields)```


#### Получить список элементов справочника по фильтру crm.status.list

[crm.status.list](https://apidocs.bitrix24.ru/api-reference/crm/status/crm-status-list.html)

```crm.status.list(order,filter)```


#### Получить элемент справочника по его символьному идентификатору crm.status.entity.items

[crm.status.entity.items](https://apidocs.bitrix24.ru/api-reference/crm/status/crm-status-entity-items.html)

```crm.status.entity.items(entityId)```


#### Получить типы справочников crm.status.entity.types

[crm.status.entity.types](https://apidocs.bitrix24.ru/api-reference/crm/status/crm-status-entity-types.html)

```crm.status.entity.types()```

## Categories


#### Получить воронку по Id crm.category.get

[crm.category.get](https://apidocs.bitrix24.ru/api-reference/crm/universal/category/crm-category-get.html)

```crm.category.get(entityTypeId,id)```


#### Добавить новую воронку crm.category.add

[crm.category.add](https://apidocs.bitrix24.ru/api-reference/crm/universal/category/crm-category-add.html)

```crm.category.add(entityTypeId,fields)```


#### Добавить новую воронку crm.category.add

[crm.category.add](https://apidocs.bitrix24.ru/api-reference/crm/universal/category/crm-category-add.html)

```crm.category.update(entityTypeId,id,fields)```


#### Удалить воронку crm.category.delete

[crm.category.delete](https://apidocs.bitrix24.ru/api-reference/crm/universal/category/crm-category-delete.html)

```crm.category.delete(entityTypeId,id)```


#### Получить поля воронки crm.category.fields

[crm.category.fields](https://apidocs.bitrix24.ru/api-reference/crm/universal/category/crm-category-fields.html)

```crm.category.fields(entityTypeId)```


#### Обновить воронку crm.category.update

[crm.category.update](https://apidocs.bitrix24.ru/api-reference/crm/universal/category/crm-category-update.html)

```crm.category.update(entityTypeId,id,fields)```


#### Получить список воронок crm.category.list

[crm.category.list](https://apidocs.bitrix24.ru/api-reference/crm/universal/category/crm-category-list.html)

```crm.category.list(entityTypeId)```

## Timelines


#### Получить информацию о комментарии crm.timeline.comment.get

[crm.timeline.comment.get](https://apidocs.bitrix24.ru/api-reference/crm/timeline/comments/crm-timeline-comment-get.html)

```crm.timeline.comment.get(id)```


#### Получить список комментариев crm.timeline.comment.list

[crm.timeline.comment.list](https://apidocs.bitrix24.ru/api-reference/crm/timeline/comments/crm-timeline-comment-list.html)

```crm.timeline.comment.list(sel,filter,order,start)```


#### Добавить комментарий crm.timeline.comment.add

[crm.timeline.comment.add](https://apidocs.bitrix24.ru/api-reference/crm/timeline/comments/crm-timeline-comment-add.html)

```crm.timeline.comment.add(fields)```


#### Обновить комментарий crm.timeline.comment.update

[crm.timeline.comment.update](https://apidocs.bitrix24.ru/api-reference/crm/timeline/comments/crm-timeline-comment-update.html)

```crm.timeline.comment.update(id,fields)```


#### Удалить комментарий crm.timeline.comment.delete

[crm.timeline.comment.delete](https://apidocs.bitrix24.ru/api-reference/crm/timeline/comments/crm-timeline-comment-delete.html)

```crm.timeline.comment.delete(id)```


#### Получить поля комментария crm.timeline.comment.fields

[crm.timeline.comment.fields](https://apidocs.bitrix24.ru/api-reference/crm/timeline/comments/crm-timeline-comment-fields.html)

```crm.timeline.comment.fields()```


#### Получить информацию о заметке crm.timeline.note.get

[crm.timeline.note.get](https://apidocs.bitrix24.ru/api-reference/crm/timeline/note/crm-timeline-note-get.html)

```crm.timeline.note.get(ownerTypeId,ownerId,itemType,itemId)```


#### Сохранить заметку crm.timeline.note.save

[crm.timeline.note.save](https://apidocs.bitrix24.ru/api-reference/crm/timeline/note/crm-timeline-note-save.html)

```crm.timeline.note.save(ownerTypeId,ownerId,itemType,itemId,text)```


#### Удалить заметку crm.timeline.note.delete

[crm.timeline.note.delete](https://apidocs.bitrix24.ru/api-reference/crm/timeline/note/crm-timeline-note-delete.html)

```crm.timeline.note.delete(ownerTypeId,ownerId,itemType,itemId)```

