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

