-- Version 5.17 - Automated Universal Join Link
wait(1)

-- =============================================
-- SERVICES & REFERENCES
-- =============================================
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualInputManager = game:GetService("VirtualInputManager")

local player = Players.LocalPlayer
local localUsername = player.Name
local remoteEvent = ReplicatedStorage:WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("RemoteEvent")

-- =============================================
-- CONFIGURATION
-- =============================================
-- !!! IMPORTANT: REPLACE WITH YOUR GITHUB PAGES URL !!!
local REDIRECT_URL_BASE = "https://fucktardissa.github.io/redirect/" 
-- !!! IMPORTANT: REPLACE WITH YOUR GITHUB PAGES URL !!!

local RIFT_NAME = "gift-rift"
local RIFT_PATH = workspace.Rendered.Rifts
local PING_ROLE_ID = "1387110078695473242"
local THUMBNAIL_URL = "https://media.discordapp.net/attachments/1371145746371579998/1387547415959179295/latest.png?ex=686303bb&is=6861b23b&hm=03a9b1ba1ee8fe38aa781f2580ba664d1be628313a5545a7f2b8baab64f3bb01&=&format=webp&quality=lossless&width=525&height=525"
local presetServerList = {"363e16d5-1c65-4ac2-be88-d5f736a1c0d9","a0807e92-b2c0-46f9-bcef-ccf9230677d1","2264f9f5-489b-4d28-8329-2c4d3ce639ed","18daa05d-aa8d-4b27-a190-ffa6c715b24a","eee732c5-27d4-45e8-8840-120ce8336f94","244e5007-61aa-49a8-ba6b-751b119a2809","7ffef965-6980-4712-b37d-64c257f21d84","6dbe6650-142d-4f32-b2c8-ca4e93465342","a84a5a73-84b0-4315-9aac-fc947ac76544","19b18d4b-9c74-44f9-bb06-ea8efbef7598","1c5bf4e0-f9c3-400d-b389-f8b681ff70c1","7593e4a3-c4aa-4409-b585-5c8d720a828c","813cc44e-a50d-4b6a-bc78-fd65915411df","22150a58-e035-4e33-a450-b11b84ee569c","be804d51-41f4-4614-bf64-a881e479d85e","16a5f730-ecc5-4311-9137-18c218c6c66b","8993fa63-2b29-41eb-88e4-a4c1f917b57e","62eb6dc7-4135-4355-a788-ef794fd4525d","a8e087c9-ad60-4cbe-b836-6b358c50b411","c16467bc-cba4-4982-a129-a26d8e7f2a7c","72857703-d9d5-4af6-9b34-b3ea684d8448","b12055c7-5df9-4285-bbee-bfed3ba22ede","28d49753-0d6a-414e-8b1f-f18de218860c","fc075600-19a0-4357-a949-27948a5fbf14","1c2d1924-cc37-40c0-b1f4-945e66fe1181","e67e4568-9a32-49c4-82c4-6c52ccbbeea9","a40bdc05-da62-493a-ba9b-c0c672bb3561","4a1eaca3-f8a4-450f-b741-483372145aea","944bebec-c09f-41e2-b8ea-f5ebd0f44458","1e02c50a-5e23-44a6-b1f6-e577f2ff095d","b12055c7-5df9-4285-bbee-bfed3ba22ede","28d49753-0d6a-414e-8b1f-f18de218860c","fc075600-19a0-4357-a949-27948a5fbf14","1c2d1924-cc37-40c0-b1f4-945e66fe1181","a40bdc05-da62-493a-ba9b-c0c672bb3561","4a1eaca3-f8a4-450f-b741-483372145aea","944bebec-c09f-41e2-b8ea-f5ebd0f44458","1e02c50a-5e23-44a6-b1f6-e577f2ff095d","f9bbd1c4-4fbf-41e9-a86a-7d20137336ad","8b98598b-3a4d-4bc2-bb8c-761dce4f988b","df826dcf-8cb5-494a-b7c1-3bcc49bf1f96","45280867-f042-4f26-b96a-fb8844add541","28f0741b-9694-49fc-8680-49252f6ae559","7f759b8b-f168-491b-9e52-072c15b101d0","cdfc47c1-3388-4740-ac30-b76ab142e1be","11b3bf6f-b16e-4992-8829-3f93d0744cfa","6cf6a295-eaf0-49a1-b05d-6b121f611d0e","8ec89765-4160-4baf-a6a7-e68c8e8e5d10","fb7e1b6a-fe0b-4214-9f81-98ebeb2e46fc","b5f1f806-199a-410f-adb8-00eb6989b444","63772553-5d27-4fbe-bd72-b9122e785c23","1c839284-7d81-4a78-b5cf-aaa8a2586112","d5fa63b6-fff2-4fdf-841e-4f620c2bd0a8","f021bf1d-6be0-4142-9712-e8cd52996d6a","5906e979-8310-4445-b19f-54f7375d97db","64fe7025-0150-47a4-8ad8-0f28099bb1dd","c4ea3f34-104f-4b85-b6fb-e672249ddee8","4c96a836-f260-4eee-b32a-a2c4435b1526","ff0f2b30-c510-48e7-b0de-522aea0a01c7","3e7b71b8-1686-48dc-a834-165075d61fdd","1e733b54-5b79-4dd0-ba07-a8d43543f7af","75eb39a3-49bb-4b39-abbb-31d3118c6d08","98e9eff6-4a27-4be3-a909-40c388e434e4","23802f34-698d-4c21-81fe-bfe6c364f18d","d4bf0326-c581-4fde-bfe8-8f0a13a028fa","cd5a9434-eee3-48ed-a712-50aeae8f068a","f82dc801-c8ab-4258-9daf-0d246724c9e4","c5eeffab-a14f-4214-9e04-5d3615298993","f45048c0-b882-4e33-a1e7-11f773ed4f1f","47955a57-f57e-41d1-92b5-df7accac0194","642c9b53-2791-499a-b24a-561ae233e9eb","4bd1348a-377b-44d0-8832-6bfcfb3e2dcb","46b52321-c204-488c-8631-096aadbfb7e8","a027e4dc-33d2-4e96-a3fa-00e9456b73fb","a370af27-73f1-4678-a70f-60619d7a1417","27989683-819e-4e96-bff4-906fca1d332f","d6d96aaf-210e-4441-8cf9-e6e5fe66c3d4","f23dd735-fe32-4482-9cd2-0825acafae04","dceb5869-6ea4-4600-8fed-56e0e063dfe0","c58711d7-bfb0-43a4-9df8-3a8ee2ae538e","68e0c60e-bc31-4e67-91f2-ae0dd1e087b0","b3f62081-462d-4bb8-a915-3d1d59c9830c","0410084d-e03a-427a-999e-2c045d46a89c","d3337715-baa1-456c-8a50-4d15a8ca1f17","0604f1dc-110b-4de7-963d-3ef89ed73724","64edc6d9-5b41-44f4-9613-251d64123de9","a33cf6b3-8d1e-4bcd-afa0-04a82d629367","48666afb-89f1-44a5-b15b-30e55635ef3b","c66d1be5-e387-4571-a395-384a22355823","905c2308-2719-4805-846b-66799cd421d3","9dbaafe3-615d-4923-951b-f57b8def2bf1","26e593d1-050c-470e-9862-c00abcffc763","f2afb595-c8ea-4fc3-9c64-a06d507c21ed","30cffe0b-891e-42c7-9f7c-6d889e968760","f9bb9d43-21f5-4137-9a15-b59eebfd1d2f","62a47b6a-174b-40be-9e2b-de6bd17fe914","2e23a83a-8c55-4353-94ef-87fed5fa1acf","0ac911c3-1ab3-4a60-8007-7833dad00f3e","0d206ded-8310-4598-96b6-a5b872b33bcf","11f3ae26-95d3-4b8b-994c-57f325cf84fa","be21022f-27ef-4f06-a61d-b0de0522d1a3","ddb4fea2-7bc5-4f2f-8a97-399453d163bd","23e21fa0-6ab6-4666-b6d3-705183eea2f5","3eec3e48-225c-4b57-bfd7-58d23b0d15f3","62628681-3907-40d5-873b-95960e453914","58c18fb4-fff8-437d-b721-e0659e1ab954","e88c36fc-96af-4ccc-8689-e1d72dcfed01","5d0134fe-f9fd-476e-82c9-2c5eb7c311a0","e7e1d08f-44d1-4b41-9abb-ebc92dfedb50","816f125c-9e73-460d-9295-3582ed77ee14","b850824c-8178-4329-a3f6-1e35417be8c0","4cf6afb8-5120-4023-a3dc-057a650c8d8d","358cc94c-1d48-4544-b914-12001db17b89","670b8ffb-177f-45c1-b7c7-33a61a85ee74","e4e2e624-5a68-462f-a083-44b4129d7a0d","34bcc6ba-abcb-4b14-960d-f7e6809d8171","4cd944c2-9d5c-4202-aeab-dd15db0204b3","0ed77e95-32d1-42b2-933d-3710e331b8f1","8c61cc54-6ca6-40a1-8074-6723f8eef4f4","3263f927-cae0-41d3-be6f-95437a0c8413","c78a9110-c78b-49fc-a3d4-f35d1d198288","a6780c26-2206-43df-8757-22ca22e7dd71","adf8ccef-147f-4b4c-83e9-12776b49ccab","e87f2b18-b460-4e9b-8a71-82af5e518022","18ff4255-36af-498d-9a82-fac3b6d847c3","d0a5ce93-4cc9-4a43-9004-c8da92b87cd1","9335aa07-a862-4745-8773-d3d0a08edf47","bd1a7e77-eb75-4c0c-a2a6-1fab0630b5cb","3cff3238-7dc3-4f23-97e0-172b27ae34cd","5f7fce71-5b1e-4056-819d-57c75ecb41e5","f45048c0-b882-4e33-a1e7-11f773ed4f1f","4bd1348a-377b-44d0-8832-6bfcfb3e2dcb","46b52321-c204-488c-8631-096aadbfb7e8","a027e4dc-33d2-4e96-a3fa-00e9456b73fb","a370af27-73f1-4678-a70f-60619d7a1417","642c9b53-2791-499a-b24a-561ae233e9eb","47955a57-f57e-41d1-92b5-df7accac0194","d6d96aaf-210e-4441-8cf9-e6e5fe66c3d4","f23dd735-fe32-4482-9cd2-0825acafae04","dceb5869-6ea4-4600-8fed-56e0e063dfe0","c58711d7-bfb0-43a4-9df8-3a8ee2ae538e","68e0c60e-bc31-4e67-91f2-ae0dd1e087b0","b3f62081-462d-4bb8-a915-3d1d59c9830c","d3337715-baa1-456c-8a50-4d15a8ca1f17","64edc6d9-5b41-44f4-9613-251d64123de9","a33cf6b3-8d1e-4bcd-afa0-04a82d629367","48666afb-89f1-44a5-b15b-30e55635ef3b","905c2308-2719-4805-846b-66799cd421d3","9dbaafe3-615d-4923-951b-f57b8def2bf1","26e593d1-050c-470e-9862-c00abcffc763","f2afb595-c8ea-4fc3-9c64-a06d507c21ed","30cffe0b-891e-42c7-9f7c-6d889e968760","f9bb9d43-21f5-4137-9a15-b59eebfd1d2f","2e23a83a-8c55-4353-94ef-87fed5fa1acf","0ac911c3-1ab3-4a60-8007-7833dad00f3e","0d206ded-8310-4598-96b6-a5b872b33bcf","11f3ae26-95d3-4b8b-994c-57f325cf84fa","be21022f-27ef-4f06-a61d-b0de0522d1a3","ddb4fea2-7bc5-4f2f-8a97-399453d163bd","23e21fa0-6ab6-4666-b6d3-705183eea2f5","62628681-3907-40d5-873b-95960e453914","58c18fb4-fff8-437d-b721-e0659e1ab954","e88c36fc-96af-4ccc-8689-e1d72dcfed01","5d0134fe-f9fd-476e-82c9-2c5eb7c311a0","e7e1d08f-44d1-4b41-9abb-ebc92dfedb50","358cc94c-1d48-4544-b914-12001db17b89","670b8ffb-177f-45c1-b7c7-33a61a85ee74","e4e2e624-5a68-462f-a083-44b4129d7a0d","34bcc6ba-abcb-4b14-960d-f7e6809d8171","4cd944c2-9d5c-4202-aeab-dd15db0204b3","0ed77e95-32d1-42b2-933d-3710e331b8f1","8c61cc54-6ca6-40a1-8074-6723f8eef4f4","3263f927-cae0-41d3-be6f-95437a0c8413","c78a9110-c78b-49fc-a3d4-f35d1d198288","a6780c26-2206-43df-8757-22ca22e7dd71","adf8ccef-147f-4b4c-83e9-12776b49ccab","e87f2b18-b460-4e9b-8a71-82af5e518022","18ff4255-36af-498d-9a82-fac3b6d847c3","d0a5ce93-4cc9-4a43-9004-c8da92b87cd1","9335aa07-a862-4745-8773-d3d0a08edf47","bd1a7e77-eb75-4c0c-a2a6-1fab0630b5cb","3cff3238-7dc3-4f23-97e0-172b27ae34cd","5f7fce71-5b1e-4056-819d-57c75ecb41e5","3033ea01-937d-4b88-a9ee-fc6b660d4aca","f336ab50-c31c-4974-8f81-e24b597af20e","381b6dfc-2f8b-44db-b43a-5fb16b36f5f6","1085d27d-0597-419d-84f0-660705835941","b41ced7c-bfc8-4ca8-aae5-0b146cc64de3","4fb4aa09-58c8-47c8-8625-0e70201403ab","4c52e699-ae90-4859-be29-57ccfaf707a4","b2585df3-7df1-44da-bd4e-50e0997d66ce","0a66be41-4eb5-46f1-8c39-689078b00f51","6d6f23a8-63f3-4a04-8493-6b983660e764","1f99ca1b-580e-4dd1-ae71-19951068e6c2","e3a3eda2-7c02-4578-8cab-6ea87bb6d783","8b428341-0ea9-443a-8cf4-3f31b6ad5a50","69f7706f-08b5-47d7-a508-a842c04bab5b","ae421c90-6b8a-4b07-87cb-3c7fb2158927","d897b3f7-978e-4044-9454-d0408d6ece46","fd371d17-1a12-4e62-8e7e-b518d4bdda4b","7af5066c-ef82-40ed-a3f6-7b56d51ad6c4","eb3c8b3e-9056-4eb8-a81a-4aa4b9c5aa0e","cda87492-c4d6-4c1a-83f0-65fc31e1586e","fd2a1168-3f99-4d6d-aa28-ec47a58d3bac","3abe4719-4819-4cca-9b91-dbce12b1db11","bd62d8b4-18da-4837-95e6-99546b61b6d5","2a036885-2dd8-4f03-8dc1-0c3bb80921c2","7ea2ee5a-182e-4793-b2b9-8d487655d64c","c5c5e8b1-f764-4cdc-966a-87f9d2a8228a","5494ce57-e6a0-404c-9b12-66bf22d3a0aa","27b60334-9c8a-4be2-9994-4ba71543e5ca","bde7e456-0a66-4dc9-b63e-6a60ba3a85d3","ba09b24c-0d04-4e25-86fd-d8a62d466b90","52063507-b497-483c-add0-49e4bad68bf6","356d742f-712a-47c4-be3f-f66bf974f6e1","f969fc35-f41a-415b-834f-8414f52fd8c7","3cfde8e1-b223-414e-9bd1-ef6b83cec2d6","0a1159a4-2a31-487c-8200-f8dd8907cd9d","6c80a10e-a75c-4587-9971-b36c00047ccd","07d7f241-3b71-41c5-9106-e47e603695b1","af7021b5-f7ac-4b67-876c-c32f551cfea2","fd3e755c-5a80-4f6f-affe-58678bb65466","9c287a20-1a1a-4ae7-83c6-93a2bfaf7e2d","b5627c01-0e69-48bf-b726-4f84baa1b8fa","ed26c87b-6fec-4f43-a3b8-38920d9e2f3c","472cb4d7-62f0-4bed-8c54-ccf8ee06bae5","766bed05-fba1-494a-9987-1b2c4d0faef1","4561fb48-7ccf-4316-8402-b00cd7695e6a","7b146531-5f34-40b4-bfdf-e27f3f25523d","efe7b52f-36c1-4511-8910-4e64f7ee674f","766bed05-fba1-494a-9987-1b2c4d0faef1","4561fb48-7ccf-4316-8402-b00cd7695e6a","7b146531-5f34-40b4-bfdf-e27f3f25523d","efe7b52f-36c1-4511-8910-4e64f7ee674f","24c0114e-01a7-4abc-a69b-468712675148","89acff20-6d78-42d0-88f6-8b3fe927f58b","dd974967-0e64-4aba-9466-b046111fa236","bb5caf11-540c-4293-8f7e-f820a3190993","b2779f66-8460-4f14-902f-ae029490c0b2","7ac556e9-3b64-450b-a93a-8cfb759d2c69","57cacd54-e18c-4297-828f-90f54e316ce8","48574bdd-2bbd-4b64-a23f-d768d850d350","f681abad-feb4-429a-8f0e-1759d0b7c26f","14f772c2-4d4b-4a04-8cff-f20f001e8eed","58e73e24-b3cf-403d-b56f-3bfc6cf3401d","06b26cdb-649d-4ca1-9522-5376c6d6ee30","efff1c4c-d777-4648-a193-4595bc188db5","97469726-9b6a-4fb2-adcc-44391d43bafd","57b85c62-ee82-403f-886c-2a5eb5b0fecf","7d9f7e77-37c3-4b56-8642-b5288f482a03","16513e44-6a9e-42c4-8ece-54298b7f1a2b","03179e8e-310c-4925-815a-c6c108139539","b195bfd0-0d58-41ee-93c7-a032ab7475a9","e23d479d-e743-41f9-8d76-26b6cefe25ac","7a7bd5fe-800f-454f-8769-78594b4f2d75","0885cec8-0ce8-4471-9d34-c15dd713623a","31950041-72e4-4d58-b67c-e7dea2d57b04","5fb67cf6-fef6-484e-8d54-5e24de795109","de4fd26e-301b-4810-be1c-4bf3d7a8794a","bf28dcae-750d-4c5f-9410-7f35c0193296","d70ca78b-cbf0-46ce-b4cb-ba1114f35177","5a466654-28ca-4ee1-b22b-80925dc5905b","fc35ecf2-cda7-4ff8-8d63-bbb9a259eaaf","dee4a54e-a3fd-46d5-a72e-32d8dd4238e1","ba4b08ca-d4c0-4270-a7e7-459ed5a1c643","201cb9a2-3fbf-4876-9f42-f5c0c7378f0f","0974fc05-119c-45ac-ae7a-23fbf60d4764","f3bc9f1a-92f7-4147-956b-b08455d74fdb","83e7be05-17fb-4628-a8f8-6d105d7374fe","5ee27ab4-d71c-4caa-b4aa-98f89919728b","1173100d-e41e-4da2-9085-b51c0b74cd08","56171d1f-3e97-47f5-93c2-4a25eedc4533","0bc70e8b-b5d3-4eff-96ea-f78f0bb86c3a","81cb8610-0116-4ca2-9b2c-0021a8ac7418","e51205d1-0048-4a6e-b178-34a9a26114ee","1105dc32-3452-453f-a681-7bd4eb91b3f5","5ffc19b2-58a6-4105-8c44-673548f42f5c","8961a1ca-241d-44de-b46c-1e815c2cbc37","801a87b1-d0e6-41b4-ae75-84949ff89ee7","0618ac5d-1bfa-432d-8096-f861e013098c","dce54be0-ebc4-4827-a9f5-50e493634b74","3c86e5fd-d366-475f-9176-53ab9a702a12","89c7aeb8-b29b-4a93-9e65-abcabc15608b","65dd111a-889e-46ba-be95-dd659ed87849","c1768887-2ccb-4fc1-84ed-83d3f09d534b","79e125b5-1fb8-4fec-a3f6-ad4a31d7b399","4884b4b9-0125-4430-bcf9-ea2dca70d677","91e25b63-04cd-452e-8c63-e7340b7a6357","c69dcd6e-0772-49f1-a601-aabefa60adbe","a432b8e3-f661-4726-a08e-792c4ee1a68f","6a8e7e59-e3be-4bb2-ab79-cca8330242f3","a052b049-553d-473f-82ca-08b39ea06730","283fbd07-ba80-48fe-ba1a-1f7fa470e0b8","04f80c5e-1b86-4004-9afd-aea11a7caf05","6e8c86cb-3c4b-4e4d-a929-098f9feb44ad","a696106d-3f13-4dc2-8c95-fbb6e01ebf2e","eb7a69e0-23bb-4fa2-8a47-a4246c0ca090","2273a748-35b0-4fa7-8f49-9188be5c518a","20fa4b97-4000-49ff-9ebc-25cd38702863","69c8a6d0-9d68-41f1-a7cf-829818268288","1483280c-1a34-4c3b-9be5-07b180eb28fa","3cee9a3a-c94a-41f6-89e4-cb8d9d54efb1","53339bd5-4015-4e36-be3d-1f0759aaa23a","8bf84f6e-8f94-4cb1-8e9b-f8483fd7b92d","6e65272b-58ff-4bef-9a6f-4d58c176988a","e737313d-929a-4798-88b0-ec5fd97efeb0","1c6390ea-6081-4ff7-bb04-5c8b6cd40b3f","ce0b8e40-e7cc-475d-a891-34e60cdea405","4ec3b5b6-dd0a-45fc-b524-49470fd5bcd8","17764756-3d4f-4382-84b3-d8eeff9ac81e","7c042831-e456-4765-8dce-23a5ca157968","b6dfcfcf-92be-470c-8983-9709de08b16e","7d338c14-abf0-430d-9a18-dc607d60e578","dafca535-ca96-45de-9d65-cd4b5a8c7c1d","557bd26f-c7e2-48c0-8a95-a01eac3964d9","43f78b5d-4621-4710-821c-c1b70440124f","3c3566f4-f39c-405b-a54a-04a163eea929","72736751-7643-4983-aa7d-25bbe91b293a","8eb28d84-a7eb-4eea-9777-e814b90e07dc","463739e8-5a92-4c8a-975a-f01a096f5c94","d9949b4f-2478-4c20-9ade-d19d294b9d7a","421c30ec-fae4-4fdc-83f0-00db5a81a283","f44b0558-c66d-47df-9f7e-4c9fc4e40276","e8552f0f-bc72-4639-a3e6-b939518b53c9","0c7ea427-816c-4280-8b7b-7cc74f150bdc","b9557dd8-3e9e-41b1-93fc-7b110023d859","6c879778-f51b-4689-99b3-2b3adcff710f","a591bbe3-9e8b-4f85-bbf0-92b9d11a4826","166c0692-7d15-4300-8358-01b7c884f796","1d556f49-a900-4ba8-bffd-c52e9ac30eae","166c0692-7d15-4300-8358-01b7c884f796","1d556f49-a900-4ba8-bffd-c52e9ac30eae","8aca5817-60d4-45ce-86ee-2f7605752b52","7959536d-1bcc-40be-8982-db16e32c100e","47175213-2f60-4ebe-9391-5df2e53ed179","420d463b-4e51-4c25-a84d-48a5171a652b","a0cb770b-5314-4fa5-b522-fafae2e7f734","f97f47aa-4056-4198-a6e6-4b2b18a0680c","6280bd28-e49f-40dc-94d6-01ece1367b2b","d4ac7eb6-4b5e-4bab-ab51-4a0a1641135f","89e507ea-85e1-4458-bb0c-6fbe8012f443","a67ec6d6-0de7-46b1-ab14-4f74e8cf8fb6","577da08d-b5b6-4564-8809-b790c9880942","4a65ad04-e8d0-4db3-9895-22c9df9d65ae","05c1cf98-be48-4040-a90e-db0d20504392","c16d1eb3-86b7-40b4-91c9-6e75a4241886","91d777fc-4f57-4f4e-bc3b-d61e26004318","9e5744d6-78d2-4ee1-b367-61973c4fe1b9","ad2ad28f-ebdc-452e-984a-84f641be048b","edfcfe8e-ad7a-4560-a13f-5aab4cac2b77","86950cf1-8278-488d-ac43-5bc29b8e32a2","2a6ced21-e362-40db-858c-e17f3bd598f3","97604b9d-5870-4d47-9ab9-3a90b93a3680","307cb6df-06e7-438f-8331-4b281a550cb2","efacb437-91a5-4123-9976-25b11e662d49","88ef857c-232b-47cb-bb73-386ebaa45477","e63b9b0c-df15-4ba3-a63a-fe4b94f8835c","3b89b682-4691-4f10-a7cb-37d5958241c9","cf106c15-a456-4421-99c0-d896fea282b9","cc709209-9a6a-468c-9e60-0edf239ac3a4","84b1a916-d492-4e67-ac18-015a49b1a5c0","bbbafaea-824f-4e8a-8a9d-0429ceb3e208","51e2e946-fa8a-4bd4-a105-215436b07cdc","5de85721-8927-4eaf-abef-d0df3ea9bb8e","af3bd5e9-1076-4301-97e0-dce344384c79","43f8b66f-bf69-43bf-b8bb-55b9a916ccc0","f7ccaa7e-5980-4c22-93d1-4f79ad8a6c86","6124b93e-a936-4829-85ad-0051df5ad897","71e6b77d-0693-42d1-8410-ae1e746fdf86","c23fb685-5dd9-412c-8106-47ca67a24ebe","13cac5d8-7665-428d-a06b-0e7738a85519","177cfdea-c091-4058-8212-322224f9c2d9","4f6e2c45-aef8-446e-9870-1b860c426b5b","2f3346b1-c809-4c28-8e2c-a5d105f8ad0f","e49833ff-946f-408a-aeb0-b427fb732c1c","fbd984b2-3884-46f7-8123-2518680f27bc","4a8112d6-3454-4109-ae26-ccb6bc658880","f88655b3-beb2-48dd-9dcc-c4715432e406","1c93250a-934e-4b97-abc9-0d85f92fe564","1d74fdcf-8cc0-4d78-914b-5673f9fb2b90","ba4aa608-118e-4f39-afee-657fe8f76396","e55e6a18-07bb-4035-b1dd-007ae69ef39b","410cc4cd-63b0-4da6-bf66-486cecfcf011","22001074-2311-4433-bf3f-0d193f298d65","063be9cd-c657-48f8-b881-99b7b7c8a2fe","0e830f5f-f7ab-49ab-966d-659c8dc1764e","5f8706f1-de67-4ec6-a92f-517e1fca0de0","fb2738a6-351f-4929-b4fe-7c3ca91c3bdb","f29deba8-800e-4796-861f-aa5f505723ed","dcf6f4f2-2df6-460b-a262-2a7609b3bedf","c1b6966d-a592-43e5-98e6-34d740787ff1","3d52616d-8b20-4a48-819b-edb5f73d4ab3","2496b493-3abd-4cfb-bee5-43f35d3d073f","0bb298c9-f240-43f8-b17f-fd3182a015c0","00c9f121-28ac-41cd-8973-ac385590d7cc","37eb4d83-4836-4536-8093-624f460660b9","3a09e8dd-cdc2-443d-892b-9306cbd343e4","f500861b-34df-4166-93c0-4f04afe8cfa5","e3b16923-9453-4000-b849-9608948de803","524d6fb8-e868-455c-88ee-c67d57c828ee","406eac1f-ae56-43fc-82eb-bf0c8382dd9b","7fa87fe0-daeb-40e0-ab6b-e6d414333db3","e5793802-4856-4822-b411-047a0d5447d1","ef0009da-664f-4254-ac52-2a7ad398e39c","cdf0bd14-d489-42c3-8125-f6d752c1f771","e3994ece-6f16-4e8b-8d6a-2a2371f41d72","02a58a6a-77c9-4833-8311-01ffa3adb1e0","3024a063-7c0d-499d-9660-9ffdd64c8989","276ebb02-35ee-42ec-901a-b65861cfac2e","4533dd8f-50a0-49b2-a939-d770b3ef78e3","e14cf761-af66-4c34-893a-6b3b81252907","e2488c36-67f6-414e-8f18-ab9d61e79a2b","df9e4f9e-ce43-4aaf-96e6-cd5fd7690d85","7abcb4ab-44f7-4b4b-a06c-25584a83275b","f9d9b0a2-ad2e-48fa-9cf8-0cda701c8b1b","128a78fb-d5e2-4a28-8152-6294b2b93451","df21f2d2-85f4-4341-8da9-02f2c6d3c6c9","fbabff41-449c-4098-afd3-3c2addbdebac","b35f3180-8929-4585-ae91-e33312ecdac4","6b8c7524-cd4b-4475-a354-2a7a3f485161","78b8c05b-2175-4d11-9708-bd4f47af10e8","d3ffd59a-61ac-4710-a525-e08230f22763","9f3fa497-4b68-46c1-9b7b-bde76497ac6d","9678502d-ba7a-4e14-bd4b-b0cace794cb7","9d6037c0-8aa2-468a-a62e-3423f7c5b270","733374a0-ab04-419b-aef5-d914b5846ad2","4beedbbe-ebd8-4257-ad0b-8c27e73fe07f","998c9dfa-d679-435c-a93e-cee709d53e9f","a16ffcab-273d-45de-8f2f-bce3b0c37e9e","aa9cae3e-2062-4c7c-8bf3-7d7170c91e22","9678502d-ba7a-4e14-bd4b-b0cace794cb7","9d6037c0-8aa2-468a-a62e-3423f7c5b270","733374a0-ab04-419b-aef5-d914b5846ad2","4beedbbe-ebd8-4257-ad0b-8c27e73fe07f","998c9dfa-d679-435c-a93e-cee709d53e9f","a16ffcab-273d-45de-8f2f-bce3b0c37e9e","aa9cae3e-2062-4c7c-8bf3-7d7170c91e22","579f1215-5d62-4264-923b-5aea17155160","53998358-bdd7-464b-92fc-fbc15f273865","0a0d9a06-3ac4-4ba5-b63e-6dfc029785c0","90bcbd06-d4c7-4e86-9744-a829161c3868","74c4c9a6-244b-40c3-9f7f-096330240cbc","55269f96-659a-4096-b9e0-f0d216a5117c","b341a54b-73c6-46e7-917a-ab932aa13c26","0458c493-f97d-4874-8bd3-e9ebb6f436e8","3ed31dce-c9fa-4d7a-b11c-be6aaef65eb2","fda87e55-f51b-443b-9dde-6d2f5f5194fa","aa429538-88dd-4e1f-afa5-bc97c90521f5","fb4cf7e2-c503-4c05-8300-129fb1fd7210","c20413b9-600c-4ff9-a95d-f0277c16f2d6","99af2bd5-bba7-4ba8-a6c1-3243bfde909b","3e7f52f5-050c-4102-9435-d0c9f49903b2","b6a1da17-9ae4-47d9-9c8f-1c6f799ecf46","5f7c4014-cde2-4e9a-829d-72e93f0c7930","f6a811c7-1e1a-4b85-a734-ebf47b41c8bc","836d1bbb-39a7-4cf8-89fc-560b6b3de55a","e1a27c3e-b8f2-4317-9395-eb4b85ea6ce6","813f2b53-ecc1-44ce-a416-2aa8e38a6a43","c21584e3-854e-43a0-a23b-023753920b07","82730ea0-7d3c-455d-b2a8-2cd6ee781999","34aacb7f-9a97-49e9-a81b-fbba951d9b29","2a2afea2-a36c-4d8c-b14a-db0a608744e0","5532585b-3b4b-4b03-ad14-9470611d270d","b8244b98-053e-4dda-9d34-9b1a773983b7","53bb0fb4-d0c6-4529-8dc1-549556cc91f9","bc5f0c6e-d413-47e7-9e06-685cf0ca0eac","37212a59-22af-48fe-841f-d752158894de","cb96ac13-c206-4147-bbfb-2ac472fa9609","040bf01b-eb87-4ce6-96eb-d47787c8c459","75b676ee-5c74-4ad1-899e-6afc94e2b1c0","945768c6-f364-4d5e-b763-c36918437cde","a0e3beca-9d4a-49af-aec0-eab482422b5a","09907af5-d2af-4e5f-8914-a8eeb8b98889","1520c0bd-5886-4bf9-8331-0b2edb91ba80","a23ad2a2-d86e-49fc-b6e5-d83ccc2d56e7","30fce92f-e744-4d7e-86ba-2891eaa028cd","d22f42a0-2b61-4e52-8082-423961e3aae2","c5ec8992-daf1-4c3b-abef-13a19d2ffcbd","2e21e36c-5339-4ad9-96be-e80128069539","056c38fc-c82b-4d1b-bed9-c1ea450aea46","17e80040-215d-4f57-951c-b04e235bf0db","16af22a0-9392-4b71-b3e3-5e0efaf2555e","a56cfb77-cb83-4297-b1f1-c6158293482e","4ae3ca95-9c31-4e46-bf5c-5ec04eed6fbb","eb6e7822-7957-4cf1-aa23-7dcf13716588","79dac78e-f040-4cf8-ad76-13a6d897222d","e84b9ed9-9649-4b80-8b9b-3e8c2f217b81","d652867b-cb90-4065-8829-033c2c25eb28","70a1db0f-8106-4e54-9339-540749aab4b6","4b42a78b-b6d7-4dbb-8154-d22910a5f09c","8e384eaa-9f06-4ce8-8e77-ebe20b584834","683278fb-8117-4a39-bb5b-e23a1fe9ddac","3ab585d3-5da5-40fb-87df-b846483080f8","68a441b9-1486-4d6c-a527-a3bce58cb65f","2fa61a1b-f8c6-4203-be53-31836d8fda06","c6058ff4-9ad5-48d1-a3ed-6f3dfd4f0ab3","41f38b4e-9888-4227-8395-d51e565808a7","f9b49854-09fd-4810-9d75-1c07911328d7","44a841f2-d386-4812-8f69-46bece62876d","5f395281-2067-4f42-8737-9428009a07a2","226de59f-027b-4ff7-86da-fa531c30cf23","a58c539d-a0c5-4961-9a21-a42b498dc9d9","7386fcb6-a2ec-4c82-aa19-4a4cd728cb23","83735f47-30bd-4919-9765-dacf5e81a858","5305cee7-c1e0-4ed6-b9bd-a741fc790b69","ca9c0daa-c65b-47ec-804d-730079d8e8a0","2547938a-59e4-45d1-9d2f-f6aac68e603e","886d2d31-2af1-416d-8837-32ed4f7c7f76","c8107fca-0141-485c-9511-229d24fb33b0","e7828cc3-c6d2-4332-8bf6-911a9fdb7b47","1d1a0af0-af59-4e77-86c5-ab35262c6f83","02da2f60-b7c7-4399-96e7-731cdc8986cf","98258956-4bbd-4524-8b75-2daaa0e77544","88b3018f-9a88-483c-b207-1ec9d0169d85","28b3f408-f1f3-473b-bc1b-17c3b31e73a9","967837d7-12cb-43b9-bf83-abdc48146856","0a8fa519-bab5-4611-a8c7-ee6c9a9b7807","d4a69b60-f715-419e-97f9-8f2428526ecd","2dfead69-6797-4043-9291-bfc01bec51e6","d1013585-b866-45d6-a40a-0d9c7e15810f","7c7e78e7-2403-400b-a7f3-68a9d26a41c7","dcb223b2-b172-4852-8883-41e9e0b7260e","368aa3ca-f026-4be4-8248-ff53ac8c2094","521b3e64-78ca-44b2-a16a-a948b0114d07","a6ee65b5-2f3f-484c-8350-5e699fc96bf3","ae400400-e5fa-4d15-b55f-346ee2c1d447","70ae443e-3ac8-4424-992e-31420efef65b","250ea5f9-4afe-4395-b7b5-ef9ea4d94a96","0a787ac4-6c91-42af-b0e1-7e2a8f412201","240a5604-7384-432c-bdf5-601aafaad95c","250ea5f9-4afe-4395-b7b5-ef9ea4d94a96","0a787ac4-6c91-42af-b0e1-7e2a8f412201","240a5604-7384-432c-bdf5-601aafaad95c","66c2a70f-6e81-439a-bfea-a329b8b15cc0","71fc06f8-9a84-4e2d-8f87-d7f07b3bd334","338d8e56-77f9-4358-981f-38caf925d89b","6aa7c2cb-cb55-496d-893b-cbfd8e75877d","342f9d65-b8bb-4d60-9cb1-8bc6ec199272","96e5f146-cb8b-4bfe-825c-30b5a1a10e44","11e4c320-b08e-407e-844a-4e4486a00abf","216d879b-bab8-45bc-a651-e90488df0d3e","4246a553-e3cf-42dc-af65-60b5845afa98","80f5e40d-5750-4c4e-9660-527f034fca70","9675457d-72d8-4020-8568-fba51023ece6","c4b7e2a9-f241-4c70-930f-c707edbd2ac1","77be22e3-ba91-4d4b-8540-a46316ab4687","2432832d-c7b3-419a-977b-166fbdfb178f","00c624fa-22a4-495e-94a0-b2377ffa0f04","f41e7509-0d88-425e-93ce-d61aad8d3535","50838b42-bf23-42cd-8218-1ca0062058dc","f6f4701d-c1f4-49ed-9a85-26defcf04000","0635b712-1c35-414c-8aab-d6e4d1fcbc27","9e3a1cd7-d933-42aa-98a9-fe6260241c9f","e0f198c3-18d1-46b7-9e0d-f9e31d76e81a","5a449206-654d-43f4-b74f-497966b80572","11dc8ffb-a89f-4c84-9d23-0557a2a7f1e4","4ac35cf7-7764-4dd7-bef1-2e2b8dda8e63","a4e2b6d4-e273-4506-af8a-d43438a9151a","8f5df41c-e3c3-4572-b39e-49277a4e09e8","42b4e3d8-d103-429c-b9bb-0cf3f23f9716","42308091-3770-4de4-a198-d8bd9a9fa09f","750f89a3-7c95-428d-96cc-cfafb397cc55","a520d365-ecea-47ce-8452-48d2646319d0","d1730ccf-9518-4798-a24c-1795408feb35","d34504d4-e5e7-4231-8975-aae9030ef199","1f05fd7f-2236-4ef6-9677-2a694c54519d","00ff6206-6c72-4805-91f4-6083b171fde7","2f0dbe94-a834-47de-adf6-8d4b827d8d2b","0f649c7f-d2f1-4d7c-be21-1c95b26d7c59","e2d33424-c98c-447e-bd74-3193d2dd822a","88d0afe9-fbc0-4e3f-992f-8978efac2cbd","77417174-0cff-4bb5-ae9d-ae68e4763f9a","396d9f9a-393b-4776-a685-3a5e34de98f4","23943ed0-6cb4-4618-8df3-6ebb46651af5","d35d0040-8baa-49a4-981f-89261c259ccf","2ac651fd-5839-4e2a-9eda-14d4cdcdc832","cfd82aa0-1a3f-4e46-bf57-f1aeb02d3f2e","f894bd7c-dd26-4bd7-83f3-f24afaabd7c1","88c9cb4e-6f71-4c13-afd8-d0675364bf73","42d99007-9351-4e90-9d99-2e284c875715","b590872d-e706-4a50-82c2-18adcf2e14ee","949785c7-0e81-4bb6-a0b7-64e3370c299e","23bfa042-dc29-4616-9692-e1c278bba747","41753d2e-a103-495a-b6ce-0f41e220dfbe","c0ffb855-6617-4808-88e6-6afb64ccaee7","6189c3c4-13f1-4dee-bde4-4d11d10ec544","37d4762a-eddd-4c92-a4fc-5b512cdefa5b","b8897c2a-3cba-4b75-befe-72bcf676fa43","c1513f92-8cd5-40a5-975b-4685499d7995","37b62cbd-21be-4029-b1a7-6a2690d154cb","111e8465-077a-4afe-a82b-a6968f429963","34148ca0-82f4-4690-9eed-88efd58d013e","56ea4b4f-9e27-4ad6-a2bd-2a321040505d","b4972ab6-c935-44c3-88de-36267be5b8bf","a4469b26-ac5b-4f8f-ace6-eb2e7ab6fb05","de4f66b0-475b-482b-989f-298aecd628f9","c259d133-30c7-459a-ac78-d30f7abfc5a7","fd18db5d-2c2b-45ad-b6dc-d912e729413d","8aa9e288-d52f-44cd-ab08-41eec4a2060f","d9e0c8fd-349a-4fa7-8cbf-f58c3d39e134","c18d8c10-1494-4466-a09f-ca0506ca6e6c","fa1cd8c0-2788-4665-b128-c48e4cd07c61","5be03d60-2c4f-4e21-8269-6ac53a5f3c01","a100ece6-0134-4202-b337-6f2a2dd1bc64","b44ff346-92da-40e6-b21a-67e2b49939fa","9e43468c-d2d2-45d4-aace-0ec69389cee6","dc351b48-5edf-47d3-9241-7c0bf9d0e491","4e45eda1-75ee-4a94-bf3f-da8ae88cb800","795c9c77-b2a0-40ce-b529-bb30ee2ba3f7","09b40e5f-2c2d-4b5e-9019-4fc56f10e78c","f44cd873-bff1-4af2-904e-aa1d1c25e003","b0449c98-a78f-4f25-8804-dacc3786598a","014b84ee-59ba-4dc1-9d16-297c2127d29b","115da283-5ceb-4386-a17d-07630be3789b","bf072bb5-48dc-4f78-8f73-636d9728d4e0","86167efe-fcec-4434-a0e7-20577f99d62d","744a4612-5cd2-4a8d-8346-1e5a3ebdf85b","ded688a1-c798-4706-8094-15357d8d13fc","13d1d158-18b9-4bbf-81c2-751739875889","f19d15bc-12e0-48f0-8c10-e29888226842","4aae5fd0-0d22-4117-9a67-2e017fe00a9f","e2f3bb31-df58-411b-8dd5-a08243c12b06","165790a7-8339-4fbf-baa0-4e6934048a28","e4422b3b-e73d-4c4b-bd39-0beae2389f6c","50fdd32f-cff5-4ba3-9f4d-7e21b82edce0","095ab1b9-8e35-4112-ade0-ec3dca967da1","c6042bc3-ef9a-4580-8089-8f1e526f2e82","a273980b-3543-419b-8c3c-30692721b4c2","0d4604a3-d2b0-4780-a14d-7637b08fae6e","6745cbb0-1376-40b5-8786-877facea4f23","09b40e5f-2c2d-4b5e-9019-4fc56f10e78c","f44cd873-bff1-4af2-904e-aa1d1c25e003","014b84ee-59ba-4dc1-9d16-297c2127d29b","115da283-5ceb-4386-a17d-07630be3789b","bf072bb5-48dc-4f78-8f73-636d9728d4e0","86167efe-fcec-4434-a0e7-20577f99d62d","744a4612-5cd2-4a8d-8346-1e5a3ebdf85b","ded688a1-c798-4706-8094-15357d8d13fc","13d1d158-18b9-4bbf-81c2-751739875889","f19d15bc-12e0-48f0-8c10-e29888226842","4aae5fd0-0d22-4117-9a67-2e017fe00a9f","e2f3bb31-df58-411b-8dd5-a08243c12b06","165790a7-8339-4fbf-baa0-4e6934048a28","e4422b3b-e73d-4c4b-bd39-0beae2389f6c","50fdd32f-cff5-4ba3-9f4d-7e21b82edce0","095ab1b9-8e35-4112-ade0-ec3dca967da1","c6042bc3-ef9a-4580-8089-8f1e526f2e82","a273980b-3543-419b-8c3c-30692721b4c2","0d4604a3-d2b0-4780-a14d-7637b08fae6e","6745cbb0-1376-40b5-8786-877facea4f23","bb5caf11-540c-4293-8f7e-f820a3190993","77417174-0cff-4bb5-ae9d-ae68e4763f9a","944bebec-c09f-41e2-b8ea-f5ebd0f44458","0ea6f867-40d0-47f0-b339-f948e102332d","5906e979-8310-4445-b19f-54f7375d97db","05c1cf98-be48-4040-a90e-db0d20504392","16a5f730-ecc5-4311-9137-18c218c6c66b","53bb0fb4-d0c6-4529-8dc1-549556cc91f9","a6945ef8-597c-4316-b63e-11b5762f44ef","356d742f-712a-47c4-be3f-f66bf974f6e1","f2afb595-c8ea-4fc3-9c64-a06d507c21ed","a9a6e833-fea3-44d3-8590-676957daa319","c1b6966d-a592-43e5-98e6-34d740787ff1","22150a58-e035-4e33-a450-b11b84ee569c","cfb9d349-95aa-48c5-b84a-6f645ab793be","82b7a89e-979d-499a-a96b-a348ba15c2ec","1dd0229a-0693-4e9e-979b-4ccfdee6d27e","98cea1b8-e2af-468d-b5cd-4ae1e1288f14","67e5cffe-d49f-4384-b24b-ac976eda7936","03d7ac4b-f2af-40c4-9d58-0db469eed387","dadd593b-d313-484e-9735-a9448375c8d4","3eec3e48-225c-4b57-bfd7-58d23b0d15f3","3ba3095b-63b3-4753-b376-6f423c96a2ee","a3b64763-66f1-42ea-94f7-1234057aba9d","aa9d976a-2957-4b82-942a-9c97a40d96ea","23230449-0928-4c1f-8f4d-ff6474221967","8635ec99-5ddc-48db-8dc3-8852221daa68","9f5be021-e11d-4045-b63e-98fcdfe34f41","bd10be00-d961-49b4-b5d8-d952ed91f3bb","392785e6-765b-482e-b056-290bdc7d10da","fd6413fe-8407-47b3-8a6f-e2686af8a0ee","0cb6f7f0-d8c3-405f-995c-81eb9d8ef45d","8ad46a7c-570d-4510-beeb-1c64c6e78d00","b58e6cd0-f008-45e9-bbee-56282699e02c","ba853cea-b720-4389-8382-62b2dd7db8c9","ffb849e0-b09b-4959-9a01-4516e540db8c","4fc3854f-c300-44ec-ac04-5d2ebde7f7da","ed481fed-d388-44a6-af87-2b8b4ad076c3","aba6e20a-6790-4b4b-b7d0-3462f7cec126","ee76bc13-f4f4-4509-8c53-b06f844c6fc0","a59cae0b-c094-4f66-8a41-7eafbf7258ca","935598b3-314e-4ffd-a5b7-eadef64c42f7","21e8606d-c9ac-446d-b856-613e347c001c","a2b40683-9eb5-4940-a4e4-8368e77055da","108497b6-1bdf-4fff-a2f0-38ab2cd580b2","11cc863b-703c-4542-b05b-5d54e135ffd9","990d3123-3310-464c-8c36-87174ffe362e","6d9d1ff8-b2ba-4f58-b30c-814edd936800","870519cd-f6cf-42a6-bb30-3926c8223e81","f55413f8-c4ba-44f9-b651-fe9680c4cab3","fefd9402-89fa-4ba7-8f58-b6445527e700","f9258c44-fa81-4cdf-8cb2-da6e494240c4","adc730f3-9c74-4151-a7ff-8a5b94354aba","521e213a-3d62-46be-8a8f-de0a8b241428","aaf2cd04-c7ac-4222-a8de-3bfe216fedf5","aea6900b-4cd2-477b-8f45-7767d968fe6f","9e9be735-d8e3-42bd-ad03-46a138a52b0c","67c55e3f-ed3e-43af-8a9a-51fc3ce67161","98ce3db9-c327-469c-adf0-af9f841146dc","929d1da9-45ae-4057-af71-d32903b8534b","73aa4d40-da69-4075-8951-8162dec35f72","30cd8516-75f9-4df5-a742-f927a1ce4ca7","c8272b92-af3b-4c42-9c73-1982a28488dd","3f2b829d-b245-4440-a940-3a6469fd0db8","12a9a2a2-59e7-4716-9183-936192d2cfb1","2d764224-a8b3-469d-b161-a851972d8191","48ec9f8a-0467-4152-903c-2953e7feb7d7","09a7f75b-3d9c-4b1b-aa90-af8267d31c9d","cb7a5d01-8b70-4b7f-83a5-7c882fe9488c","a17708ce-efb7-401c-bf59-261755e07fc4","ff39b32e-9d8f-4953-9094-92bd44a922e3","0c73a063-c75a-49d3-a61f-8591d803cc89","07af3b87-c35e-4319-a866-12d8e077fa6f","a62d4a63-1523-4324-9e7b-e3ca3af5abae","c6b9a1fd-6da2-42e2-b4e7-5e316379cd96","a47881e8-df94-4d4e-99b9-bf7fb623b3ae","f972dc96-e133-421d-acdc-874da29d99a6","e6b384cf-c0af-4dd6-a2aa-11e34ed7f1b3","55a65dd8-0014-46a7-8e26-697d19e82a18","a4a72886-de82-487a-9b5a-81b48c26e6ef","e6b384cf-c0af-4dd6-a2aa-11e34ed7f1b3","ee341573-dedd-4732-97dc-04ba38d74771","4a65a9c7-f9d1-4f3d-af03-837329512d5b","2acf26ee-8783-46de-9034-60648bc0cf5a","ad152d9d-cdbd-4714-b9da-e09306605b5f","76117ccf-69c6-44c7-b8d2-767273bd21ed","0f2e40c8-1b58-4643-a228-4882eda92fed","e8f3bf56-0f1f-461a-a5f1-5fbbc15fd21e","4e45e5c1-f211-434d-9346-d55dbac43e57","3da10fa8-0b62-4c8f-af63-be46b8c0077e","400c638f-6bfa-46d5-bdee-d421d7c187e6","44ea1bc8-1ac2-436d-9de4-d29feb4148d3","bcd48ea1-3d13-4033-baeb-e80203e6ba5a","d7f74d16-f477-4c4b-b65d-eec4a73c12b8","93cb0a5e-8ec8-4e20-9361-da1941ccf2af","13c2759b-1042-4d41-9eab-97847f4d0518","3fca538d-5433-4ae1-a9ba-7eaaedea8651","b4644eb3-0a13-4eab-8930-ea013ad7ae20","c388215c-7dfc-4413-8b2f-29899bfa8a0f","55a65dd8-0014-46a7-8e26-697d19e82a18","7364c331-613f-46e4-9a37-ac6e2be64987","bc5ed925-7ec7-4b63-9442-a826e915c557","170bc215-b36c-4302-b16c-34f3ca68e376","d736d7a2-d5b8-433e-bd31-b9efe9649e1b","1b6c1f52-fe82-4535-a671-331eaa41e411","48b9e353-396e-44c4-a0dc-827575e33509","3597533f-00f5-4a29-be8e-e39e3445e782","e07acbef-b473-4ab8-98a0-0423d2d8f387","6d95e21f-0683-4dbf-bde6-ef2d12ed2a80","1b67c87b-1cbf-4428-800b-bd9d3663d943","067fa829-a25c-4293-a9f5-3b5ea4ad1fee","4a819afd-67b8-4af5-8b35-a2856b2ef9f6","e7886bcf-6e8d-46a1-b53b-b5f44aed0875","bae7756a-49cd-47c8-aef8-ac95e556f877","15ac81b9-cd18-494c-b23a-ea2d3ed43b0f","ad395512-d631-4060-8e92-c3931a06a30b","0c117904-ab93-4248-b986-2c1fcb9e5456","c059bc1f-e0ca-44cc-a4f4-9ae6c897e86f","ab150b5d-bbc5-4573-8338-870ec2d30018","7af150c3-0931-4ecb-b201-3fd8bdf2c811","842ef33d-3dad-496d-870b-42ccc13d1ec1","70ba77ce-5505-4dea-9402-4fc763644bb4","e9231fd9-2b45-46e3-9367-9062f0991b5e","05060a0e-b4fa-4e47-b267-7dcd2c59fbe9"}local TWEEN_SPEED = 200

-- Webhook URLs
local w_main = {104, 116, 116, 112, 115, 58, 47, 47, 112, 116, 98, 46, 100, 105, 115, 99, 111, 114, 100, 46, 99, 111, 109, 47, 97, 112, 105, 47, 119, 101, 98, 104, 111, 111, 107, 115, 47, 49, 51, 56, 53, 48, 53, 49, 56, 49, 52, 57, 55, 51, 53, 51, 56, 51, 57, 52, 47, 71, 88, 105, 101, 66, 104, 111, 74, 110, 89, 119, 90, 101, 66, 65, 67, 80, 57, 99, 48, 56, 100, 99, 115, 100, 105, 74, 108, 51, 67, 89, 70, 110, 99, 52, 106, 78, 118, 90, 87, 73, 111, 118, 95, 117, 109, 55, 48, 119, 51, 105, 110, 55, 76, 108, 73, 72, 87, 56, 73, 57, 103, 101, 85, 122, 117, 100, 57}
local w_notify = {104, 116, 116, 112, 115, 58, 47, 47, 112, 116, 98, 46, 100, 105, 115, 99, 111, 114, 100, 46, 99, 111, 109, 47, 97, 112, 105, 47, 119, 101, 98, 104, 111, 111, 107, 115, 47, 49, 51, 56, 56, 54, 52, 56, 55, 50, 49, 55, 53, 48, 54, 56, 55, 55, 55, 52, 47, 51, 105, 100, 104, 89, 99, 106, 79, 106, 122, 55, 98, 50, 50, 79, 80, 51, 101, 84, 73, 120, 69, 86, 55, 49, 71, 117, 86, 56, 86, 110, 86, 110, 80, 70, 57, 115, 48, 71, 84, 78, 48, 113, 97, 112, 120, 48, 120, 49, 103, 70, 114, 101, 72, 73, 49, 120, 108, 73, 119, 121, 75, 51, 103, 108, 88, 86, 111}

-- =============================================
-- STATE VARIABLES
-- =============================================
local tweenController = { active = false, currentTween = nil }
local isHatching = false
local isTeleporting = false
getgenv().autoPressR = false

-- =============================================
-- UTILITY FUNCTIONS
-- =============================================
local function decodeWebhookURL(tbl) 
    local url = "" 
    for i,v in ipairs(tbl) do 
        url = url .. string.char(v) 
    end 
    return url 
end

local function sendWebhook(targetUrl, payload)
    local requestBody = HttpService:JSONEncode(payload)
    local requestOptions = {Url = targetUrl, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = requestBody}
    pcall(function() if syn and syn.request then return syn.request(requestOptions) elseif request then return request(requestOptions) elseif http and http.request then return http.request(requestOptions) else warn("No known client-side HTTP function found.") end end)
end

local function isRiftValid(riftName)
    local rift = RIFT_PATH:FindFirstChild(riftName)
    if rift and rift:FindFirstChild("Display") and rift.Display:IsA("BasePart") then
        return rift
    end
    return nil
end

-- =============================================
-- RIFT REPORTING
-- =============================================
local function sendRiftReport(riftInstance)
    local luckValue, expiresValue, height = "", "", math.floor(riftInstance.Display.Position.Y)
    local gameId, jobId = game.PlaceId, game.JobId
    
    -- [[ ⭐️ MODIFIED LINE ⭐️ ]]
    -- Creates a single, universal join link that works on all devices.
    local universalJoinUrl = string.format("%s?id=%s", REDIRECT_URL_BASE, jobId)

    local iconPart = riftInstance.Display:FindFirstChild("Icon")
    if iconPart and iconPart:FindFirstChild("Luck") then luckValue = iconPart.Luck.Text end

    local surfaceGui = riftInstance.Display:FindFirstChild("SurfaceGui")
    if surfaceGui and surfaceGui:FindFirstChild("Timer") then
        local timerText = surfaceGui.Timer.Text
        local minutes, seconds = tonumber(string.match(timerText, "(%d+) ?m")) or 0, tonumber(string.match(timerText, "(%d+) ?s")) or 0
        if (minutes + seconds) > 0 then expiresValue = string.format("<t:%d:R>", os.time() + (minutes * 60) + seconds) end
    end
    
    local riftDetails = ""
    if luckValue ~= "" then riftDetails = riftDetails .. "Luck Multi: **" .. luckValue .. "**\n" end
    if expiresValue ~= "" then riftDetails = riftDetails .. "Expires: " .. expiresValue .. "\n" end
    riftDetails = riftDetails .. "Height: **" .. tostring(height) .. "**"

    local payload = {
        content = "🚨 **EMERGENCY RIFT INVASION!** 🚨",
        embeds = {
            {
                color = 13631488,
                title = "🚨 BRUH RIFT INVASION DETECTED! 🛸",
                description = "🛸 yo we're invading now 🛸",
                fields = {
                    { name = "👾 Server ID", value = "`" .. jobId .. "`", inline = true },
                    { name = "🎮 Game ID", value = "`" .. tostring(gameId) .. "`", inline = true },
                    { name = "📋 Rift Details", value = riftDetails, inline = false },
                    -- [[ ⭐️ MODIFIED LINE ⭐️ ]]
                    -- Replaced the two old links with our new universal one.
                    { name = "🔗 Universal Join Link", value = "[**Click Here to Join Server**]("..universalJoinUrl..")", inline = false }
                },
                thumbnail = {
                    url = THUMBNAIL_URL 
                }
            }
        }
    }
    
    local decoded_w_main = decodeWebhookURL(w_main)
    sendWebhook(decoded_w_main, payload)
end

-- =============================================
-- TWEENING & HATCHING SYSTEM
-- =============================================
local function getCharacterParts() local char = player.Character or player.CharacterAdded:Wait() return char:WaitForChild("HumanoidRootPart"), char:WaitForChild("Humanoid") end
local function startHatchingLoop()
    print("Arrived at rift. Starting to press 'R' to hatch.")
    getgenv().autoPressR = true
end
local function teleportToRift(targetPosition, onComplete, riftName) tweenController.active = true local humanoidRootPart, humanoid = getCharacterParts() if not humanoidRootPart or not humanoid then warn("Character parts not found, cannot tween.") tweenController.active = false if onComplete then onComplete(riftName) end return end local originalState = { WalkSpeed = humanoid.WalkSpeed, AutoRotate = humanoid.AutoRotate, JumpPower = humanoid.JumpPower, Gravity = workspace.Gravity } humanoid.WalkSpeed, humanoid.AutoRotate, humanoid.JumpPower, workspace.Gravity = 0, false, 0, 0 print("Attempting initial remote teleport to get close to the rift zone...") pcall(function() remoteEvent:FireServer("Teleport", "Workspace.Worlds.The Overworld.Islands.Twilight.Island.Portal.Spawn") task.wait(1.5) humanoidRootRootPart, humanoid = getCharacterParts() print("Initial teleport complete. Starting tween for final positioning.") end) task.spawn(function() while tweenController.active and humanoidRootPart and humanoidRootPart.Parent do if (humanoidRootPart.Position - targetPosition).Magnitude < 5 then print("Reached target position via tween.") break end if not (tweenController.currentTween and tweenController.currentTween.PlaybackState == Enum.PlaybackState.Playing) then local time = (humanoidRootPart.Position - targetPosition).Magnitude / math.max(1, TWEEN_SPEED) tweenController.currentTween = TweenService:Create(humanoidRootPart, TweenInfo.new(time, Enum.EasingStyle.Linear), {CFrame = CFrame.new(targetPosition)}) tweenController.currentTween:Play() end task.wait(0.1) end if tweenController.currentTween then tweenController.currentTween:Cancel() end if humanoid and humanoid.Parent then humanoid.WalkSpeed, humanoid.AutoRotate, humanoid.JumpPower, workspace.Gravity = originalState.WalkSpeed, originalState.AutoRotate, originalState.JumpPower, originalState.Gravity end tweenController.active = false if onComplete then onComplete(riftName) end end) end

-- =============================================
-- MAIN TELEPORT & HOPS LOGIC
-- =============================================
local function attemptHop()
    if isTeleporting then
        warn("Hop cancelled: A teleport is already in progress.")
        return
    end
    if type(presetServerList) ~= "table" or #presetServerList == 0 then 
        warn("Cannot hop: Server list is empty!")
        return 
    end
    isTeleporting = true
    print("Picking a random server from the preset list...")
    local serverId = presetServerList[math.random(1, #presetServerList)]
    local message = string.format("`V5.17` | User **%s** is hopping.\n> **From:** `%s`\n> **To:** `%s`", localUsername, game.JobId, serverId)
    
    local decoded_w_notify = decodeWebhookURL(w_notify)
    sendWebhook(decoded_w_notify, {content = message})

    task.wait(1)
    print("Initiating teleport now...")
    pcall(function() TeleportService:TeleportToPlaceInstance(game.PlaceId, serverId, player) end)
end

if not _G.TeleportHandlerConnected then
    _G.TeleportHandlerConnected = true
    TeleportService.TeleportInitFailed:Connect(function(_, teleportResult, errorMessage)
        warn("Teleport failed! Resetting lock. Reason: " .. errorMessage)
        isTeleporting = false
        local failMessage = string.format("`V5.17` | **%s** teleport failed.\n> **Reason:** `%s`", localUsername, errorMessage)
        
        local decoded_w_notify = decodeWebhookURL(w_notify)
        sendWebhook(decoded_w_notify, {content = failMessage})
    end)
end

-- =============================================
-- MAIN EXECUTION FLOW
-- =============================================
print("Script V5.17 started. Looking for rift...")

task.spawn(function()
    while true do
        if getgenv().autoPressR then
            VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.R, false, game)
            task.wait()
            VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.R, false, game)
        end
        task.wait()
    end
end)

task.spawn(function()
    while task.wait(5) do
        if isHatching then
            if not isRiftValid(RIFT_NAME) then
                print("Rift is no longer valid. Stopping hatching and preparing to hop.")
                isHatching = false
                getgenv().autoPressR = false 
            end
        elseif isTeleporting then
            print("Waiting for current teleport to complete...")
        else
            local riftInstance = isRiftValid(RIFT_NAME)
            if riftInstance then
                isHatching = true 
                print("RIFT FOUND! State locked. Reporting once and moving...")
                
                sendRiftReport(riftInstance)
                
                local decoded_w_notify = decodeWebhookURL(w_notify)
                
                local simpleNotifyMessage = {content = RIFT_NAME .. " found!!!"}
                sendWebhook(decoded_w_notify, simpleNotifyMessage)
                
                local targetPos = riftInstance.Display.Position + Vector3.new(0, 3, -10)
                teleportToRift(targetPos, startHatchingLoop, RIFT_NAME)
                
                local startMessage = string.format("`V5.17` | User **%s** found a "..RIFT_NAME.."! Moving to hatch.", localUsername)
                sendWebhook(decoded_w_notify, {content = startMessage})
            else
                print("No valid rift found. Attempting to hop.")
                attemptHop()
            end
        end
    end
end)
