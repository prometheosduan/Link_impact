with ticket_id_table as 
(select requester_uuid, create_timestamp as time, uuid as ticket_id
from dim_bliss_ticket
where 
/*3 week before and after*/
(create_timestamp > '2016-05-09' and create_timestamp < '2016-6-21')
and
/* 90 drivers who used the link but still send tix*/
requester_uuid in (
'19bed999-fa68-4275-939d-11f391cd1c56',
'197cea3c-7c84-46eb-8291-27b66f94ea11',
'19517979-eba4-4454-9e88-bc48c4d904ce',
'18b70a4d-5c91-4995-aa31-790853a8e89c',
'186e6d27-3b62-4f50-8c7a-c38a9fedf80a',
'1826ad87-4e90-4bac-8233-6ced38faac06',
'18234c3b-b6ff-443c-8785-f37ce0c82abe',
'181bc1d0-4d3b-4ca7-88a0-49019a0b9f41',
'17af7a7a-0b95-44b1-8b00-6f25e8deb648',
'1772d97f-7b14-40d1-ab96-682a9c54908f',
'177167a5-c577-429b-b9e9-f42ca2177356',
'168da16f-a872-4ec6-9c5c-0b916744daa9',
'13152244-d44b-4474-9cae-ebf1bae57240',
'12c7e73f-24b0-46c6-98b1-f89502b7f735',
'11eedd52-2e01-4bb5-933b-c81013026349',
'117301c3-6bf0-4224-9090-fbd37b048959',
'10dfe359-a8dc-4d05-ad5f-8b5913c18a58',
'107927c1-e295-47ef-a08d-67f7ea93312e',
'1038593c-5225-4ac7-8672-75ac68e5c062',
'0f27d1ff-cdd5-478a-8d58-426472598bce',
'0df55ccc-3cd8-4c69-9b20-edcda1a8f38a',
'0c486d56-977f-4389-98c2-127712990843',
'0abab567-4ffa-4b5c-bf03-d9b269474485',
'0a5e11f4-f532-43d7-a07b-1d2c829835ae',
'0a08e6a1-8cad-4615-a6e7-9de52c0bbf4a',
'08d2cb34-c2d3-4c82-9059-8e1f1c358c9d',
'088f3f67-7cbe-4779-8b9d-ddc0df141bd4',
'062ebeac-bcc7-430c-bdba-906b27d9e3b2',
'06073e76-c3e7-4eec-b928-f53fea2bd7bc',
'02080a19-e29b-4000-84c0-c6dd82f734d7',
'0156ffb5-8d97-4a89-8290-13b69bd1d4ca',
'010e0a6c-9c99-4ef1-93ee-78152f6e8ee5',
'19bed999-fa68-4275-939d-11f391cd1c56',
'19b509a6-e004-4833-ac3b-6df2ffb56f51',
'19a3860e-be61-421d-8aad-ab5a5a16fd7d',
'18ae0a3d-e978-4b19-ae6d-7026a608738a',
'18234c3b-b6ff-443c-8785-f37ce0c82abe',
'158078d1-993d-44af-bf69-451f776659c3',
'156e92af-95ae-49be-a81b-31b44e244000',
'11f03ab5-c73b-4e0e-aaf4-4dde22cf5530',
'115cd0e3-fb5b-4a7c-8eb4-30be1862d8d7',
'10e03657-b22c-41c5-99e9-463861cfea0a',
'1055e08a-f6dc-48fa-80b7-3b35e47bec0f',
'103aaa7b-77c7-4eae-a390-773d4e0c2a82',
'10168315-7b35-4556-8edc-9c1c1e0c09cb',
'0fff60d8-d880-49e2-ad37-4f164473d134',
'0f741c4e-2fd8-4a32-bdc7-6bb97b5f389a',
'0f4b71b1-3087-401f-881c-19230f05eaf6',
'0e6a7186-488b-45b4-b7a9-03e3636c58e6',
'0e68d566-55a2-49d6-86a5-c3b9d850158a',
'0e4455f1-0569-4f67-acd8-1bb4c485c737',
'0d8a60ff-5464-40ec-9a53-ea1927c3b32d',
'0cb99fa2-6941-45c5-8b31-50fb7e7b8a44',
'0ca69037-6944-4b73-adc0-41565e7ef60e',
'0c7a67e7-709b-4c7a-8dcd-0885bb096565',
'0abab567-4ffa-4b5c-bf03-d9b269474485',
'07ebf4db-2eac-48fd-8dba-8e7c37cc5ec2',
'078ab001-b338-4b50-ae32-273f44f42435',
'063d0ce9-4d39-49a5-a261-1a857db7a4a1',
'04459910-ef49-4b6f-b929-a8a765422cdc',
'03b28081-b9df-4295-a6b0-94751cb3d4e6',
'02752b11-4099-4c2d-97c8-4aa5b34e3dec',
'00dd3dbe-79b8-43e1-90a4-e5f35f46b13f',
'004cb94a-719e-4320-98d6-4f79bc381862',
'19a09bc6-0140-495d-90cd-7221ce9d2033',
'1977c459-cbc9-4371-8e62-857c624f7248',
'154d6df8-46eb-4e78-a0df-2f0b8ba4611d',
'145eebd4-1fc8-4d87-8b73-7c2ddc4219ad',
'12e67d40-0dc5-4ce9-96e8-cadce6b69ffc',
'10dfe359-a8dc-4d05-ad5f-8b5913c18a58',
'0f9a4e3b-2f1a-441f-8ce7-6ac4479700fb',
'0f4b71b1-3087-401f-881c-19230f05eaf6',
'0f28c58e-5436-4b97-9d83-3abad5edb606',
'0f27d1ff-cdd5-478a-8d58-426472598bce',
'0e4455f1-0569-4f67-acd8-1bb4c485c737',
'0dbb39fa-a70f-4007-8904-ded98676a2d2',
'0c486d56-977f-4389-98c2-127712990843',
'0c453850-5ba8-4738-9e0c-96df46b7d569',
'09c7a613-1f98-4729-ac0f-e89d27ed0687',
'09aa0370-adf2-464d-bf1c-65451700e5a1',
'095cd941-7817-48d7-af08-a2a5bc99c7d3',
'08b3720a-7cb3-4994-9c45-745c28b8847f',
'08aadfb3-ee53-4b8d-9bff-4ebbd6202e8f',
'084d3a0e-5073-4d29-ac32-510aebb5e59b',
'0827afb6-7b5a-4719-850c-729f4c6bcf86',
'078ab001-b338-4b50-ae32-273f44f42435',
'072df4af-f742-49cd-b1bd-e7a4c0ba66e0',
'05b60449-4f50-4914-96e3-ed602b461dd3',
'045e0b62-0467-4937-97cc-edf6abc20e89',
'03afa888-06a5-4bd6-850b-2d731a59a28d'
 )
and
/*incentive constraints*/
((ancestor_1_name || ' > ' || ancestor_2_name || ' > ' || ancestor_3_name ilike '%Driver > Payment > Incentives%') or
 (ancestor_1_name || '>' || ancestor_2_name || '>' || ancestor_3_name || '>' || ancestor_4_name ilike '%Driver > Account > Momentum Partner Rewards > Uber Rewards (China)%'))
 
order by requester_uuid, time
)


select distinct t.requester_uuid, t.time, 
(case 
 when h.content like '<%'then substring(h.content from '[^:]*$')
 else h.content
 end) as ticket_content
from hbo_message h join ticket_id_table t on t.ticket_id = h.contact_id
where h.source = 'inappsupport'
order by t.requester_uuid, t.time
