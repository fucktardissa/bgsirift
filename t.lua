-- Version 5.15 - Reverted to V5.14 and added both reliable and web join links.
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
local RIFT_NAME = "gift-rift"
local RIFT_PATH = workspace.Rendered.Rifts
local PING_ROLE_ID = "1387110078695473242"
local THUMBNAIL_URL = "https://i.imgur.com/your_image_here.png" -- IMPORTANT: Replace with your desired image URL
local presetServerList = {"add326fa-3bf5-46fe-8350-b2a6e6153105","75b676ee-5c74-4ad1-899e-6afc94e2b1c0","b3f62081-462d-4bb8-a915-3d1d59c9830c","50fdd32f-cff5-4ba3-9f4d-7e21b82edce0","00bae54e-103e-4835-a13a-30499b00c767","867064a5-6d25-4b3e-ba0d-24c365074a87","165790a7-8339-4fbf-baa0-4e6934048a28","e6af1e1b-117b-47a5-89ec-1d5265a1d742","3fd7c9e2-5eff-407e-8c93-de1094132988","836dfed0-0b40-4cfc-8a5f-57907f00cd00","bc5ed925-7ec7-4b63-9442-a826e915c557","4f6e2c45-aef8-446e-9870-1b860c426b5b","278eec25-484a-4a9d-9730-f3a293e4a707","21ec6e25-bf0b-4f29-9796-08d2982c0c77","6c36b9df-b72c-4977-815b-9a110f64cc9c","ca9c0daa-c65b-47ec-804d-730079d8e8a0","ef6f6110-67fa-4a32-a587-3dc6685ce2c5","70a1db0f-8106-4e54-9339-540749aab4b6","0a66be41-4eb5-46f1-8c39-689078b00f51","f88655b3-beb2-48dd-9dcc-c4715432e406","1a6b395c-74d6-41b5-8487-d0e19884b352","0410084d-e03a-427a-999e-2c045d46a89c","3da10fa8-0b62-4c8f-af63-be46b8c0077e","1dd0229a-0693-4e9e-979b-4ccfdee6d27e","7c042831-e456-4765-8dce-23a5ca157968","d6d96aaf-210e-4441-8cf9-e6e5fe66c3d4","226de59f-027b-4ff7-86da-fa531c30cf23","45c9947d-49e7-40bf-962b-e65e18d18835","6d4106be-65c5-4e89-a671-9dcadb99c01d","f70f9c8f-499a-4276-9e7f-ec41887db128","82083add-17af-4739-8a53-3dae844043b3","27989683-819e-4e96-bff4-906fca1d332f","8a463df3-e496-4043-bcf9-9f16221b6ae3","ee657165-0bfe-4ddc-be22-30037c8a663b","42308091-3770-4de4-a198-d8bd9a9fa09f","df3cc53e-f16c-45e7-af01-b2786b330dea","7d45e599-36f0-475d-b394-21c03855b1fd","8ec89765-4160-4baf-a6a7-e68c8e8e5d10","30cffe0b-891e-42c7-9f7c-6d889e968760","2c699c6a-555a-4bb5-946b-e90f59eb5256","d55fd32a-9b38-45bd-ab7f-830c52f290f8","201cb9a2-3fbf-4876-9f42-f5c0c7378f0f","463739e8-5a92-4c8a-975a-f01a096f5c94","a591bbe3-9e8b-4f85-bbf0-92b9d11a4826","48f20610-239e-46c5-9270-d19da19aca24","9335aa07-a862-4745-8773-d3d0a08edf47","46b52321-c204-488c-8631-096aadbfb7e8","7abcb4ab-44f7-4b4b-a06c-25584a83275b","89acff20-6d78-42d0-88f6-8b3fe927f58b","76117ccf-69c6-44c7-b8d2-767273bd21ed","6dbe6650-142d-4f32-b2c8-ca4e93465342","342ae992-9751-4858-9fd7-f95a4a822462","9f9ffbf4-e36b-4bae-ade8-9d116dbc4004","f5c02985-b655-46c3-90b2-cc316885f49f","2b880537-dc48-4c07-b0c5-b789d48cd402","69f925af-c9ba-4d4a-aeac-22bea6f3bb3a","d4ac7eb6-4b5e-4bab-ab51-4a0a1641135f","3bc42358-3ea0-4383-811c-7086a281e835","39ee5b8d-b66a-4081-9943-0e5ace4960b2","6cbda284-5a62-4b0c-806f-87ad06f900c8","c66d1be5-e387-4571-a395-384a22355823","bbbafaea-824f-4e8a-8a9d-0429ceb3e208","daafb3f2-572c-45e9-abbd-bee3efdd1fe4","c2eb740a-ebdc-4948-ae43-a7d0a99a1aac","93773603-96ec-4838-a6d2-812529f8dd20","e277f638-a667-4fa2-bd50-90328168b8a0","7e49ca76-9899-4820-9596-aebaa8172584","e23d479d-e743-41f9-8d76-26b6cefe25ac","fb7e1b6a-fe0b-4214-9f81-98ebeb2e46fc","3fca538d-5433-4ae1-a9ba-7eaaedea8651","54a58aa6-7e54-4ccc-90a0-391059f3ae1b","bc6bc77d-ecfd-4f23-96a9-7a94b82ddf0d","5906e979-8310-4445-b19f-54f7375d97db","1f9268b1-8e43-43cc-a23c-9f0dfc40da6c","e3b16923-9453-4000-b849-9608948de803","fefd9402-89fa-4ba7-8f58-b6445527e700","0a787ac4-6c91-42af-b0e1-7e2a8f412201","add326fa-3bf5-46fe-8350-b2a6e6153105","b3f62081-462d-4bb8-a915-3d1d59c9830c","00bae54e-103e-4835-a13a-30499b00c767","867064a5-6d25-4b3e-ba0d-24c365074a87","165790a7-8339-4fbf-baa0-4e6934048a28","e6af1e1b-117b-47a5-89ec-1d5265a1d742","3fd7c9e2-5eff-407e-8c93-de1094132988","836dfed0-0b40-4cfc-8a5f-57907f00cd00","bc5ed925-7ec7-4b63-9442-a826e915c557","278eec25-484a-4a9d-9730-f3a293e4a707","21ec6e25-bf0b-4f29-9796-08d2982c0c77","6c36b9df-b72c-4977-815b-9a110f64cc9c","ca9c0daa-c65b-47ec-804d-730079d8e8a0","70a1db0f-8106-4e54-9339-540749aab4b6","f88655b3-beb2-48dd-9dcc-c4715432e406","1a6b395c-74d6-41b5-8487-d0e19884b352","0410084d-e03a-427a-999e-2c045d46a89c","3da10fa8-0b62-4c8f-af63-be46b8c0077e","1dd0229a-0693-4e9e-979b-4ccfdee6d27e","7c042831-e456-4765-8dce-23a5ca157968","d6d96aaf-210e-4441-8cf9-e6e5fe66c3d4","226de59f-027b-4ff7-86da-fa531c30cf23","45c9947d-49e7-40bf-962b-e65e18d18835","6d4106be-65c5-4e89-a671-9dcadb99c01d","f70f9c8f-499a-4276-9e7f-ec41887db128","82083add-17af-4739-8a53-3dae844043b3","8a463df3-e496-4043-bcf9-9f16221b6ae3","ee657165-0bfe-4ddc-be22-30037c8a663b","42308091-3770-4de4-a198-d8bd9a9fa09f","df3cc53e-f16c-45e7-af01-b2786b330dea","7d45e599-36f0-475d-b394-21c03855b1fd","8ec89765-4160-4baf-a6a7-e68c8e8e5d10","30cffe0b-891e-42c7-9f7c-6d889e968760","2c699c6a-555a-4bb5-946b-e90f59eb5256","d55fd32a-9b38-45bd-ab7f-830c52f290f8","201cb9a2-3fbf-4876-9f42-f5c0c7378f0f","463739e8-5a92-4c8a-975a-f01a096f5c94","a591bbe3-9e8b-4f85-bbf0-92b9d11a4826","48f20610-239e-46c5-9270-d19da19aca24","9335aa07-a862-4745-8773-d3d0a08edf47","46b52321-c204-488c-8631-096aadbfb7e8","7abcb4ab-44f7-4b4b-a06c-25584a83275b","89acff20-6d78-42d0-88f6-8b3fe927f58b","76117ccf-69c6-44c7-b8d2-767273bd21ed","6dbe6650-142d-4f32-b2c8-ca4e93465342","342ae992-9751-4858-9fd7-f95a4a822462","9f9ffbf4-e36b-4bae-ade8-9d116dbc4004","2b880537-dc48-4c07-b0c5-b789d48cd402","f5c02985-b655-46c3-90b2-cc316885f49f","69f925af-c9ba-4d4a-aeac-22bea6f3bb3a","3bc42358-3ea0-4383-811c-7086a281e835","39ee5b8d-b66a-4081-9943-0e5ace4960b2","6cbda284-5a62-4b0c-806f-87ad06f900c8","c66d1be5-e387-4571-a395-384a22355823","bbbafaea-824f-4e8a-8a9d-0429ceb3e208","daafb3f2-572c-45e9-abbd-bee3efdd1fe4","c2eb740a-ebdc-4948-ae43-a7d0a99a1aac","93773603-96ec-4838-a6d2-812529f8dd20","e277f638-a667-4fa2-bd50-90328168b8a0","7e49ca76-9899-4820-9596-aebaa8172584","e23d479d-e743-41f9-8d76-26b6cefe25ac","3fca538d-5433-4ae1-a9ba-7eaaedea8651","54a58aa6-7e54-4ccc-90a0-391059f3ae1b","bc6bc77d-ecfd-4f23-96a9-7a94b82ddf0d","5906e979-8310-4445-b19f-54f7375d97db","1f9268b1-8e43-43cc-a23c-9f0dfc40da6c","e3b16923-9453-4000-b849-9608948de803","90cf7937-f64d-41d9-a8c1-c2c27dc92785","4e45e5c1-f211-434d-9346-d55dbac43e57","a8fbf593-0d2c-43ca-a20f-9f4957e25d38","379ac376-34c8-4abb-a0e0-49f338271766","a409392f-ab36-492a-bc2a-9d4ebe071c37","40a4adb1-c395-4a90-b2b6-ec282d2e54c0","d4bf0326-c581-4fde-bfe8-8f0a13a028fa","115da283-5ceb-4386-a17d-07630be3789b","f82dc801-c8ab-4258-9daf-0d246724c9e4","f45048c0-b882-4e33-a1e7-11f773ed4f1f","a027e4dc-33d2-4e96-a3fa-00e9456b73fb","47955a57-f57e-41d1-92b5-df7accac0194","363e16d5-1c65-4ac2-be88-d5f736a1c0d9","63772553-5d27-4fbe-bd72-b9122e785c23","d2158793-bbac-48d7-9f2a-fc9e0638f1fa","52b572bf-57bb-4106-9196-f4ca4606d614","77be22e3-ba91-4d4b-8540-a46316ab4687","886d2d31-2af1-416d-8837-32ed4f7c7f76","68e0c60e-bc31-4e67-91f2-ae0dd1e087b0","bde7e456-0a66-4dc9-b63e-6a60ba3a85d3","12a9a2a2-59e7-4716-9183-936192d2cfb1","e1be419a-b76e-4d93-93f9-f6b0223f0be9","813cc44e-a50d-4b6a-bc78-fd65915411df","64edc6d9-5b41-44f4-9613-251d64123de9","37d4762a-eddd-4c92-a4fc-5b512cdefa5b","f9bb9d43-21f5-4137-9a15-b59eebfd1d2f","62a47b6a-174b-40be-9e2b-de6bd17fe914","23802f34-698d-4c21-81fe-bfe6c364f18d","67a3c118-2ff4-41a0-a3f7-b1ad7dfd9473","11f3ae26-95d3-4b8b-994c-57f325cf84fa","9dbaafe3-615d-4923-951b-f57b8def2bf1","62a47b6a-174b-40be-9e2b-de6bd17fe914","f9bb9d43-21f5-4137-9a15-b59eebfd1d2f","11f3ae26-95d3-4b8b-994c-57f325cf84fa","9dbaafe3-615d-4923-951b-f57b8def2bf1","a0f27650-5dfb-4aa7-9b90-70ebeae10251","f592aa86-f98f-4bbf-b22c-fa50d3dde9f8","be4dfbb3-ae2f-4c50-9927-2db16a6cf075","ddb4fea2-7bc5-4f2f-8a97-399453d163bd","b98be200-43d7-4f24-a1d9-84c453efb9e9","23e21fa0-6ab6-4666-b6d3-705183eea2f5","358cc94c-1d48-4544-b914-12001db17b89","b02cc725-f409-4d04-99bf-fe4f0925af24","3e7b71b8-1686-48dc-a834-165075d61fdd","26e593d1-050c-470e-9862-c00abcffc763","670b8ffb-177f-45c1-b7c7-33a61a85ee74","8c61cc54-6ca6-40a1-8074-6723f8eef4f4","be21022f-27ef-4f06-a61d-b0de0522d1a3","4a8112d6-3454-4109-ae26-ccb6bc658880","34bcc6ba-abcb-4b14-960d-f7e6809d8171","c118cc1f-a572-4f5d-915a-ce7abf96d37e","905c2308-2719-4805-846b-66799cd421d3","0ed77e95-32d1-42b2-933d-3710e331b8f1","3263f927-cae0-41d3-be6f-95437a0c8413","b850824c-8178-4329-a3f6-1e35417be8c0","c6587cc6-5597-4c82-9ef1-cf86b3ce61a2","18ff4255-36af-498d-9a82-fac3b6d847c3","e87f2b18-b460-4e9b-8a71-82af5e518022","d0a5ce93-4cc9-4a43-9004-c8da92b87cd1","a6780c26-2206-43df-8757-22ca22e7dd71","96bda656-7adc-4a39-b69e-1701b5d41a18","4cd944c2-9d5c-4202-aeab-dd15db0204b3","9e065965-aa7b-4eef-bc43-eabe3674c2a8","1085d27d-0597-419d-84f0-660705835941","e3a3eda2-7c02-4578-8cab-6ea87bb6d783","48574bdd-2bbd-4b64-a23f-d768d850d350","14c60e12-1cd2-4bc3-a71e-7aa9e9f8d484","8b428341-0ea9-443a-8cf4-3f31b6ad5a50","aa6874aa-abed-49c3-b487-eed70ea2baaf","1c2d1924-cc37-40c0-b1f4-945e66fe1181","89fc4939-56ac-4c77-a28c-cc3aee9b8d97","a8e087c9-ad60-4cbe-b836-6b358c50b411","8e6b98e4-6693-48e7-8879-30ae15a65512","aab1d2cb-c3ab-4e73-b11f-c9d2621bc99b","71264b81-1c94-41e9-a762-6e061d53ae0a","fd371d17-1a12-4e62-8e7e-b518d4bdda4b","5b762955-8589-4a41-ac78-000cd40362e6","d547ba30-b577-4537-9de4-dccf1233ad02","2a036885-2dd8-4f03-8dc1-0c3bb80921c2","59785750-17be-4117-91ee-1f5765937492","4c52e699-ae90-4859-be29-57ccfaf707a4","1aafe232-b9ce-4120-9561-7e8a53190a83","fd2a1168-3f99-4d6d-aa28-ec47a58d3bac","9e320476-d0e9-407f-8bf8-c223d7b59be4","96b26f81-3a0b-46ea-93ea-b1eed84671d7","80755b09-1746-4b38-b7fd-e5f96efa8eed","1f99ca1b-580e-4dd1-ae71-19951068e6c2","4fb4aa09-58c8-47c8-8625-0e70201403ab","bdb93c79-6c87-4d9a-9cbb-f307511fc7a0","a9f4ba8e-0025-4a56-a217-936425934899","7ea2ee5a-182e-4793-b2b9-8d487655d64c","722f6fd5-75da-43db-8d38-3ca0bf74c4f8","ac56f757-bbbf-4309-8a2b-72abaa2f3476","0a1159a4-2a31-487c-8200-f8dd8907cd9d","05b4b7ae-3c7b-475e-9e49-b4b1e46b43ab","cda87492-c4d6-4c1a-83f0-65fc31e1586e","fd3e755c-5a80-4f6f-affe-58678bb65466","d39cdb96-a679-4ede-bcb2-ee06c58144fc","af7021b5-f7ac-4b67-876c-c32f551cfea2","b7e11708-bcd2-46fb-814f-b4c23fdb4ef9","62b8df12-9542-40da-a167-ad8499ed368a","7b146531-5f34-40b4-bfdf-e27f3f25523d","472cb4d7-62f0-4bed-8c54-ccf8ee06bae5","b5627c01-0e69-48bf-b726-4f84baa1b8fa","9b2da401-daeb-49da-8b96-90253ac532a4","24c0114e-01a7-4abc-a69b-468712675148","2d764224-a8b3-469d-b161-a851972d8191","3c407c6a-87b9-4450-97de-1a87024ee379","356d742f-712a-47c4-be3f-f66bf974f6e1","57b55a5f-64ea-43b6-a52b-8d711007ee9a","790549ec-b730-4f78-89cc-68d52b50ce3d","9b2eaaef-2fb3-4456-938a-eaa9c4a2bbeb","3b0d9d87-0b51-4769-b14e-dd87a0f5cd8a","bb5caf11-540c-4293-8f7e-f820a3190993","f81caa59-9ab9-485d-b010-986dbb6bf2eb","f681abad-feb4-429a-8f0e-1759d0b7c26f","58e73e24-b3cf-403d-b56f-3bfc6cf3401d","07d7f241-3b71-41c5-9106-e47e603695b1","0885cec8-0ce8-4471-9d34-c15dd713623a","16513e44-6a9e-42c4-8ece-54298b7f1a2b","bf28dcae-750d-4c5f-9410-7f35c0193296","6bcda107-4547-4d83-9625-e575cda6bfe0","57125c7f-a6f5-41c5-95ec-3f798470c059","57cacd54-e18c-4297-828f-90f54e316ce8","5fb67cf6-fef6-484e-8d54-5e24de795109","1a57b3a0-fa1f-43c9-b256-7135010cf28d","f35938bd-6719-4702-bff9-2282e559f5eb","4786830a-ab8c-4057-8d86-17c8e92667e0","2264f9f5-489b-4d28-8329-2c4d3ce639ed","392785e6-765b-482e-b056-290bdc7d10da","c0c14fb4-e077-4eb8-bb26-19ad496f0d32","4786830a-ab8c-4057-8d86-17c8e92667e0","2264f9f5-489b-4d28-8329-2c4d3ce639ed","392785e6-765b-482e-b056-290bdc7d10da","c0c14fb4-e077-4eb8-bb26-19ad496f0d32","fc35ecf2-cda7-4ff8-8d63-bbb9a259eaaf","f4f451e8-ffa3-4c9a-8fef-6a3f2b25579b","6d95e21f-0683-4dbf-bde6-ef2d12ed2a80","766bed05-fba1-494a-9987-1b2c4d0faef1","5ffc19b2-58a6-4105-8c44-673548f42f5c","1c839284-7d81-4a78-b5cf-aaa8a2586112","104e4e40-23e9-4b9a-b965-cb28cd7a59e1","aceee4cf-4f57-4f11-949a-28972083e238","f3bc9f1a-92f7-4147-956b-b08455d74fdb","0974fc05-119c-45ac-ae7a-23fbf60d4764","067742a9-2c13-4544-9d52-a4a56e44f2aa","7593e4a3-c4aa-4409-b585-5c8d720a828c","91e25b63-04cd-452e-8c63-e7340b7a6357","e51205d1-0048-4a6e-b178-34a9a26114ee","dee4a54e-a3fd-46d5-a72e-32d8dd4238e1","dd834276-bbbd-4565-85ad-225f3b44b579","7a7bd5fe-800f-454f-8769-78594b4f2d75","6e8c86cb-3c4b-4e4d-a929-098f9feb44ad","6a8e7e59-e3be-4bb2-ab79-cca8330242f3","9bf60ea8-645c-4b9d-b1da-89082904ad28","360ff449-173c-426d-ba11-7ab8cfb17531","20fa4b97-4000-49ff-9ebc-25cd38702863","a052b049-553d-473f-82ca-08b39ea06730","264a2dbb-a64e-41ba-b757-fa3b3bfcba33","c69dcd6e-0772-49f1-a601-aabefa60adbe","283fbd07-ba80-48fe-ba1a-1f7fa470e0b8","0bc70e8b-b5d3-4eff-96ea-f78f0bb86c3a","5f395281-2067-4f42-8737-9428009a07a2","e737313d-929a-4798-88b0-ec5fd97efeb0","3ba3095b-63b3-4753-b376-6f423c96a2ee","04f80c5e-1b86-4004-9afd-aea11a7caf05","e003d857-88a7-42ce-aca1-4101e470e245","1483280c-1a34-4c3b-9be5-07b180eb28fa","44ea1bc8-1ac2-436d-9de4-d29feb4148d3","ba853cea-b720-4389-8382-62b2dd7db8c9","421c30ec-fae4-4fdc-83f0-00db5a81a283","1d556f49-a900-4ba8-bffd-c52e9ac30eae","2273a748-35b0-4fa7-8f49-9188be5c518a","76b8fecf-c5fc-4cdb-a235-73f97031e9e4","f44b0558-c66d-47df-9f7e-4c9fc4e40276","22150a58-e035-4e33-a450-b11b84ee569c","1c6390ea-6081-4ff7-bb04-5c8b6cd40b3f","8eb28d84-a7eb-4eea-9777-e814b90e07dc","65ed3ec2-8a13-4f2d-b629-d10dc2980db3","6e65272b-58ff-4bef-9a6f-4d58c176988a","4a819afd-67b8-4af5-8b35-a2856b2ef9f6","9c49e391-8c5c-41ad-89f6-5f8f870e3232","7d338c14-abf0-430d-9a18-dc607d60e578","921720e5-e16a-4302-b5a4-b43a047613b9","62840da6-5fd1-45a1-9d29-aa1b94cf8ebf","078a2a20-c27e-4dc3-90ce-09093ead8e41","df826dcf-8cb5-494a-b7c1-3bcc49bf1f96","00e2a18f-a5ee-47a0-8261-90b2b1195fc2","37852226-6c91-45f6-b261-4388a30f863d","4ec3b5b6-dd0a-45fc-b524-49470fd5bcd8","400c638f-6bfa-46d5-bdee-d421d7c187e6","d9949b4f-2478-4c20-9ade-d19d294b9d7a","8bf84f6e-8f94-4cb1-8e9b-f8483fd7b92d","e87c5701-0717-423d-8103-303a811ca81e","dafca535-ca96-45de-9d65-cd4b5a8c7c1d","28b3f408-f1f3-473b-bc1b-17c3b31e73a9","5cc2f95e-e3e3-4958-8dd6-20639f2c658d","4da1b6c5-9981-48ab-be78-b7a795bb006b","adf8ccef-147f-4b4c-83e9-12776b49ccab","efd42bda-6de0-4290-b8ed-316a431b06b5","166c0692-7d15-4300-8358-01b7c884f796","7c6a9193-464a-4568-a7de-4f46ff4c2ca3","8aca5817-60d4-45ce-86ee-2f7605752b52","ffb849e0-b09b-4959-9a01-4516e540db8c","e91e16c7-cbd6-4036-b7ec-075f23ebdb98","420d463b-4e51-4c25-a84d-48a5171a652b","39cd3671-0853-4931-9494-d49ed9af022d","a0cb770b-5314-4fa5-b522-fafae2e7f734","e7933b54-8db6-45e1-a556-a796fdd90bb5","05c1cf98-be48-4040-a90e-db0d20504392","edfcfe8e-ad7a-4560-a13f-5aab4cac2b77","c16d1eb3-86b7-40b4-91c9-6e75a4241886","a17708ce-efb7-401c-bf59-261755e07fc4","86950cf1-8278-488d-ac43-5bc29b8e32a2","14400b25-caac-4b02-b8ac-997a5173153c","51e2e946-fa8a-4bd4-a105-215436b07cdc","f10f88e3-fb78-40e1-8bc5-1ade255eed63","7dbd2400-2a50-4ab5-b6ba-f96fca79b523","c4ea3f34-104f-4b85-b6fb-e672249ddee8","7959536d-1bcc-40be-8982-db16e32c100e","cc709209-9a6a-468c-9e60-0edf239ac3a4","4a65ad04-e8d0-4db3-9895-22c9df9d65ae","ec692178-fc7a-4f67-b92e-987a62531b1b","af3bd5e9-1076-4301-97e0-dce344384c79","ae2364fa-b34c-49e2-9342-3e67e6225676","6124b93e-a936-4829-85ad-0051df5ad897","82b7a89e-979d-499a-a96b-a348ba15c2ec","ad2ad28f-ebdc-452e-984a-84f641be048b","125baeea-0ae6-410d-9053-91d7a5e9671c","f7ccaa7e-5980-4c22-93d1-4f79ad8a6c86","c23fb685-5dd9-412c-8106-47ca67a24ebe","82b7a89e-979d-499a-a96b-a348ba15c2ec","ad2ad28f-ebdc-452e-984a-84f641be048b","125baeea-0ae6-410d-9053-91d7a5e9671c","f7ccaa7e-5980-4c22-93d1-4f79ad8a6c86","c23fb685-5dd9-412c-8106-47ca67a24ebe","a2129a08-4604-4d10-bab1-35d2cc45ad79","063be9cd-c657-48f8-b881-99b7b7c8a2fe","289fcf28-e835-43ec-bef8-49ccb8b22a9f","6e480fc5-eecd-44f6-adda-ef57cd6e36da","e49833ff-946f-408a-aeb0-b427fb732c1c","e55e6a18-07bb-4035-b1dd-007ae69ef39b","3de6dd7a-99a3-4dde-8722-131d9276db53","5f8706f1-de67-4ec6-a92f-517e1fca0de0","fb2738a6-351f-4929-b4fe-7c3ca91c3bdb","bae7756a-49cd-47c8-aef8-ac95e556f877","30f91d8b-126d-4293-b0b2-666ee8c21d0e","b7ae1ab4-da89-4511-b891-e7c33d0589da","894b4eb5-a372-4241-886d-78160ad5b1f5","c1b6966d-a592-43e5-98e6-34d740787ff1","f29deba8-800e-4796-861f-aa5f505723ed","3d52616d-8b20-4a48-819b-edb5f73d4ab3","3c62a676-ee51-4539-9b84-d2a6244999e1","0cf49b45-903a-4e5d-98ad-2446df203240","524d6fb8-e868-455c-88ee-c67d57c828ee","d897b3f7-978e-4044-9454-d0408d6ece46","506bbb60-cb6a-4110-91f4-d5ddc7f3f8ee","cdf0bd14-d489-42c3-8125-f6d752c1f771","37eb4d83-4836-4536-8093-624f460660b9","02a58a6a-77c9-4833-8311-01ffa3adb1e0","cf420aef-58aa-4704-aaee-9c39758fbe3c","e3994ece-6f16-4e8b-8d6a-2a2371f41d72","d1f81459-986f-42b4-ba4f-589c88ff725f","b19b6ac5-b538-4d7e-8251-8aaa086b6908","a370af27-73f1-4678-a70f-60619d7a1417","733374a0-ab04-419b-aef5-d914b5846ad2","22001074-2311-4433-bf3f-0d193f298d65","25c3249c-e5ff-48b0-b0b1-e03a9a303bd7","25426dff-4c7c-4241-96e9-005678bdfad8","df9e4f9e-ce43-4aaf-96e6-cd5fd7690d85","72862f6e-28b2-4599-972d-accba866e777","276ebb02-35ee-42ec-901a-b65861cfac2e","dcf6f4f2-2df6-460b-a262-2a7609b3bedf","fbabff41-449c-4098-afd3-3c2addbdebac","4ed4a3e2-efef-470f-8c89-4d808e75a1f6","c0140886-0687-4c42-b466-7b86ee46c03e","9a38e3b5-40c1-4379-8489-c22decfdc164","87dc7e59-52ef-455b-bc21-4581cc75f19b","676360ac-2902-4305-9bb3-46b725714c19","128a78fb-d5e2-4a28-8152-6294b2b93451","22931cf2-2055-4b86-acdc-cf6377e14fc5","779b91d3-0b44-4c2c-a166-df732d242104","b343a066-db28-430a-9d87-52b297c6d01f","aa9cae3e-2062-4c7c-8bf3-7d7170c91e22","53998358-bdd7-464b-92fc-fbc15f273865","b35b6d2e-ce39-4a65-ae11-bb36b0dd8a27","d3ffd59a-61ac-4710-a525-e08230f22763","3b3ef919-41a6-4cda-a3c8-21bf4955b828","63e5a075-e60e-4158-a0da-9c9b334bc3b6","ddca4a04-9971-4895-a541-5406aac38f51","a16ffcab-273d-45de-8f2f-bce3b0c37e9e","e8502b13-3b11-4d2b-9d4e-62961c32650a","82044585-6c54-4d09-9867-529a7f9b7071","579f1215-5d62-4264-923b-5aea17155160","d29fe4af-e730-4495-bf4f-f0abe23aa47e","4beedbbe-ebd8-4257-ad0b-8c27e73fe07f","410cc4cd-63b0-4da6-bf66-486cecfcf011","31950041-72e4-4d58-b67c-e7dea2d57b04","998c9dfa-d679-435c-a93e-cee709d53e9f","332532eb-7dad-47e0-91f1-9e80a39f0b7b","93cb0a5e-8ec8-4e20-9361-da1941ccf2af","5a2731a5-399a-4e1a-9671-d590fd820e90","6cf6a295-eaf0-49a1-b05d-6b121f611d0e","e2488c36-67f6-414e-8f18-ab9d61e79a2b","df21f2d2-85f4-4341-8da9-02f2c6d3c6c9","ee76bc13-f4f4-4509-8c53-b06f844c6fc0","33ddcd90-ea0b-4ec2-9818-9c9131d080e9","74c4c9a6-244b-40c3-9f7f-096330240cbc","55a65dd8-0014-46a7-8e26-697d19e82a18","f6a811c7-1e1a-4b85-a734-ebf47b41c8bc","3e7f52f5-050c-4102-9435-d0c9f49903b2","99af2bd5-bba7-4ba8-a6c1-3243bfde909b","160feb85-5220-4b28-bfc0-812723a973bb","ce9e9cbe-7718-4404-be77-39be831fda36","e1a27c3e-b8f2-4317-9395-eb4b85ea6ce6","fda87e55-f51b-443b-9dde-6d2f5f5194fa","1f0ea379-b3f1-4a1e-ac1b-c45b9c050d61","48666afb-89f1-44a5-b15b-30e55635ef3b","b6a1da17-9ae4-47d9-9c8f-1c6f799ecf46","8b48552e-83dc-4426-97dc-24c792fda83a","5f7c4014-cde2-4e9a-829d-72e93f0c7930","836d1bbb-39a7-4cf8-89fc-560b6b3de55a","c7e53c78-6434-4d8f-b0e6-2a4adc45a488","935598b3-314e-4ffd-a5b7-eadef64c42f7","9820b053-d4b2-457c-b75b-831ff9cc2b02","62ac972d-e66f-4ef6-88e0-c970abe991bf","6652309e-8b82-493d-a414-7cffaf039cd0","1f4c9a7a-43f9-4113-aaaf-3dc1af25c38e","34aacb7f-9a97-49e9-a81b-fbba951d9b29","040bf01b-eb87-4ce6-96eb-d47787c8c459","c21584e3-854e-43a0-a23b-023753920b07","1f4c9a7a-43f9-4113-aaaf-3dc1af25c38e","34aacb7f-9a97-49e9-a81b-fbba951d9b29","040bf01b-eb87-4ce6-96eb-d47787c8c459","c21584e3-854e-43a0-a23b-023753920b07","5532585b-3b4b-4b03-ad14-9470611d270d","1a1e12ef-13cc-440c-b551-4c1d25ee3ed6","a0e3beca-9d4a-49af-aec0-eab482422b5a","3518827d-0122-4302-b9a0-51f5a4e538e4","37212a59-22af-48fe-841f-d752158894de","e84b9ed9-9649-4b80-8b9b-3e8c2f217b81","09907af5-d2af-4e5f-8914-a8eeb8b98889","ab1e189b-313f-4dd5-a89c-4a9ceacb7f56","f3ba5f52-da55-4db8-8900-5799a69f7117","bc5f0c6e-d413-47e7-9e06-685cf0ca0eac","ad6eb204-77ab-4e5c-98e4-4b8b0e180a3b","b1cd3152-b89f-4e63-984e-af4ba9ec6ba0","17e80040-215d-4f57-951c-b04e235bf0db","e07acbef-b473-4ab8-98a0-0423d2d8f387","b8244b98-053e-4dda-9d34-9b1a773983b7","170bc215-b36c-4302-b16c-34f3ca68e376","091a8e2d-2b91-47fc-ae51-8d07780c25ba","a62d4a63-1523-4324-9e7b-e3ca3af5abae","d652867b-cb90-4065-8829-033c2c25eb28","acd3dfb1-789e-42f7-86f1-7db3a537ac2a","b9955bd3-ab8c-4ae4-92b6-01270341842c","c92f86b1-7fb2-4e30-9fdb-b40736a768a4","030bc71c-aa55-4d86-a8f4-05095f94557a","3ab585d3-5da5-40fb-87df-b846483080f8","f9b49854-09fd-4810-9d75-1c07911328d7","83735f47-30bd-4919-9765-dacf5e81a858","0213f76c-81e0-42f1-ad96-a199aa26d50d","2fa61a1b-f8c6-4203-be53-31836d8fda06","44a841f2-d386-4812-8f69-46bece62876d","4b42a78b-b6d7-4dbb-8154-d22910a5f09c","0c117904-ab93-4248-b986-2c1fcb9e5456","4a1eaca3-f8a4-450f-b741-483372145aea","d462ba17-e328-4baf-9359-2b3a5eb624a6","a56cfb77-cb83-4297-b1f1-c6158293482e","a1e87ce9-1173-4e2d-9837-17c7ca0b54df","11cc863b-703c-4542-b05b-5d54e135ffd9","1d1a0af0-af59-4e77-86c5-ab35262c6f83","c6b9a1fd-6da2-42e2-b4e7-5e316379cd96","967837d7-12cb-43b9-bf83-abdc48146856","ae400400-e5fa-4d15-b55f-346ee2c1d447","d4a69b60-f715-419e-97f9-8f2428526ecd","521b3e64-78ca-44b2-a16a-a948b0114d07","a6ee65b5-2f3f-484c-8350-5e699fc96bf3","b5f1f806-199a-410f-adb8-00eb6989b444","4cf6afb8-5120-4023-a3dc-057a650c8d8d","451ab95a-3d86-4aeb-9286-acc83d77f7b1","16a5f730-ecc5-4311-9137-18c218c6c66b","842ef33d-3dad-496d-870b-42ccc13d1ec1","8b98598b-3a4d-4bc2-bb8c-761dce4f988b","c418f4af-866c-43b3-bfb4-577735adb584","e99bf2d2-e86c-4a40-8e11-654c43da5359","b4644eb3-0a13-4eab-8930-ea013ad7ae20","dbe3aa02-770c-41e2-9e17-8d366d21ed7b","72857703-d9d5-4af6-9b34-b3ea684d8448","eae3fa68-97f2-4877-b1a7-4f4a820c1532","96e5f146-cb8b-4bfe-825c-30b5a1a10e44","8734689c-73b6-4a13-87a3-2c41cd9c56a4","9675457d-72d8-4020-8568-fba51023ece6","f41e7509-0d88-425e-93ce-d61aad8d3535","5063b964-40f7-4ec5-a631-694d0b5e454a","00c624fa-22a4-495e-94a0-b2377ffa0f04","0635b712-1c35-414c-8aab-d6e4d1fcbc27","cb7a5d01-8b70-4b7f-83a5-7c882fe9488c","9c616a15-6045-4799-855b-5632b31d6d1b","a5cb85f0-9981-4c1b-8778-1ae3a513f532","98ce3db9-c327-469c-adf0-af9f841146dc","d9a6925b-472c-49e8-8591-fc3711db4c21","16a70f53-c129-48f3-87cd-0bcd99a609ce","f6f4701d-c1f4-49ed-9a85-26defcf04000","2432832d-c7b3-419a-977b-166fbdfb178f","50838b42-bf23-42cd-8218-1ca0062058dc","b10550fd-1b07-47e1-a044-c1acd025c475","5a449206-654d-43f4-b74f-497966b80572","a4e2b6d4-e273-4506-af8a-d43438a9151a","96a40ac9-cf68-45d6-b294-c51389cc89cd","42b4e3d8-d103-429c-b9bb-0cf3f23f9716","5f7fce71-5b1e-4056-819d-57c75ecb41e5","214fb321-5579-49a3-b5e5-b31804c5f30a","70ba77ce-5505-4dea-9402-4fc763644bb4","d3337715-baa1-456c-8a50-4d15a8ca1f17","7684743f-f301-4d07-a4aa-4724cb523b87","7d832591-0ba7-47a0-82f8-a4a8390109e7","2f0dbe94-a834-47de-adf6-8d4b827d8d2b","00ff6206-6c72-4805-91f4-6083b171fde7","68af4119-e10f-4eb2-80fc-e99380a554cd","a520d365-ecea-47ce-8452-48d2646319d0","d1730ccf-9518-4798-a24c-1795408feb35","0f2e40c8-1b58-4643-a228-4882eda92fed","eeaef93f-b203-4415-8d4e-3c531bd758b0","eee732c5-27d4-45e8-8840-120ce8336f94","3a47599f-23cb-4a18-8814-aea68d03c824","b6d256ea-3443-4628-baaf-ec83dcb71e8c","e2d33424-c98c-447e-bd74-3193d2dd822a","88d0afe9-fbc0-4e3f-992f-8978efac2cbd","396d9f9a-393b-4776-a685-3a5e34de98f4","f894bd7c-dd26-4bd7-83f3-f24afaabd7c1","9a38e3b5-40c1-4379-8489-c22decfdc164","676360ac-2902-4305-9bb3-46b725714c19","128a78fb-d5e2-4a28-8152-6294b2b93451","22931cf2-2055-4b86-acdc-cf6377e14fc5","779b91d3-0b44-4c2c-a166-df732d242104","b343a066-db28-430a-9d87-52b297c6d01f","aa9cae3e-2062-4c7c-8bf3-7d7170c91e22","53998358-bdd7-464b-92fc-fbc15f273865","b35b6d2e-ce39-4a65-ae11-bb36b0dd8a27","d3ffd59a-61ac-4710-a525-e08230f22763","63e5a075-e60e-4158-a0da-9c9b334bc3b6","a16ffcab-273d-45de-8f2f-bce3b0c37e9e","ddca4a04-9971-4895-a541-5406aac38f51","e8502b13-3b11-4d2b-9d4e-62961c32650a","82044585-6c54-4d09-9867-529a7f9b7071","579f1215-5d62-4264-923b-5aea17155160","d29fe4af-e730-4495-bf4f-f0abe23aa47e","4beedbbe-ebd8-4257-ad0b-8c27e73fe07f","410cc4cd-63b0-4da6-bf66-486cecfcf011","31950041-72e4-4d58-b67c-e7dea2d57b04","998c9dfa-d679-435c-a93e-cee709d53e9f","332532eb-7dad-47e0-91f1-9e80a39f0b7b","93cb0a5e-8ec8-4e20-9361-da1941ccf2af","6cf6a295-eaf0-49a1-b05d-6b121f611d0e","e2488c36-67f6-414e-8f18-ab9d61e79a2b","ee76bc13-f4f4-4509-8c53-b06f844c6fc0","df21f2d2-85f4-4341-8da9-02f2c6d3c6c9","33ddcd90-ea0b-4ec2-9818-9c9131d080e9","74c4c9a6-244b-40c3-9f7f-096330240cbc","55a65dd8-0014-46a7-8e26-697d19e82a18","f6a811c7-1e1a-4b85-a734-ebf47b41c8bc","3e7f52f5-050c-4102-9435-d0c9f49903b2","99af2bd5-bba7-4ba8-a6c1-3243bfde909b","160feb85-5220-4b28-bfc0-812723a973bb","ce9e9cbe-7718-4404-be77-39be831fda36","e1a27c3e-b8f2-4317-9395-eb4b85ea6ce6","fda87e55-f51b-443b-9dde-6d2f5f5194fa","1f0ea379-b3f1-4a1e-ac1b-c45b9c050d61","b6a1da17-9ae4-47d9-9c8f-1c6f799ecf46","48666afb-89f1-44a5-b15b-30e55635ef3b","8b48552e-83dc-4426-97dc-24c792fda83a","5f7c4014-cde2-4e9a-829d-72e93f0c7930","836d1bbb-39a7-4cf8-89fc-560b6b3de55a","c7e53c78-6434-4d8f-b0e6-2a4adc45a488","935598b3-314e-4ffd-a5b7-eadef64c42f7","9820b053-d4b2-457c-b75b-831ff9cc2b02","62ac972d-e66f-4ef6-88e0-c970abe991bf","6652309e-8b82-493d-a414-7cffaf039cd0","1f4c9a7a-43f9-4113-aaaf-3dc1af25c38e","34aacb7f-9a97-49e9-a81b-fbba951d9b29","040bf01b-eb87-4ce6-96eb-d47787c8c459","c21584e3-854e-43a0-a23b-023753920b07","5532585b-3b4b-4b03-ad14-9470611d270d","1a1e12ef-13cc-440c-b551-4c1d25ee3ed6","3518827d-0122-4302-b9a0-51f5a4e538e4","a0e3beca-9d4a-49af-aec0-eab482422b5a","37212a59-22af-48fe-841f-d752158894de","e84b9ed9-9649-4b80-8b9b-3e8c2f217b81","09907af5-d2af-4e5f-8914-a8eeb8b98889","ab1e189b-313f-4dd5-a89c-4a9ceacb7f56","f3ba5f52-da55-4db8-8900-5799a69f7117","bc5f0c6e-d413-47e7-9e06-685cf0ca0eac","b1cd3152-b89f-4e63-984e-af4ba9ec6ba0","e07acbef-b473-4ab8-98a0-0423d2d8f387","17e80040-215d-4f57-951c-b04e235bf0db","b8244b98-053e-4dda-9d34-9b1a773983b7","091a8e2d-2b91-47fc-ae51-8d07780c25ba","170bc215-b36c-4302-b16c-34f3ca68e376","a62d4a63-1523-4324-9e7b-e3ca3af5abae","d652867b-cb90-4065-8829-033c2c25eb28","acd3dfb1-789e-42f7-86f1-7db3a537ac2a","b9955bd3-ab8c-4ae4-92b6-01270341842c","c92f86b1-7fb2-4e30-9fdb-b40736a768a4","030bc71c-aa55-4d86-a8f4-05095f94557a","3ab585d3-5da5-40fb-87df-b846483080f8","f9b49854-09fd-4810-9d75-1c07911328d7","83735f47-30bd-4919-9765-dacf5e81a858","0213f76c-81e0-42f1-ad96-a199aa26d50d","2fa61a1b-f8c6-4203-be53-31836d8fda06","44a841f2-d386-4812-8f69-46bece62876d","4b42a78b-b6d7-4dbb-8154-d22910a5f09c","0c117904-ab93-4248-b986-2c1fcb9e5456","4a1eaca3-f8a4-450f-b741-483372145aea","d462ba17-e328-4baf-9359-2b3a5eb624a6","7386fcb6-a2ec-4c82-aa19-4a4cd728cb23","063be9cd-c657-48f8-b881-99b7b7c8a2fe","efd42bda-6de0-4290-b8ed-316a431b06b5","11e4c320-b08e-407e-844a-4e4486a00abf","a591bbe3-9e8b-4f85-bbf0-92b9d11a4826","27991503-32e8-48de-b3a4-b3e4de3f3099","f972dc96-e133-421d-acdc-874da29d99a6","3d2fe66f-d4ae-43b3-a619-719a52b04586","1e8fd3d1-56b7-4cb5-b213-1a33b7aba89e","3c3566f4-f39c-405b-a54a-04a163eea929","dce54be0-ebc4-4827-a9f5-50e493634b74","aa9d976a-2957-4b82-942a-9c97a40d96ea","adc730f3-9c74-4151-a7ff-8a5b94354aba","d736d7a2-d5b8-433e-bd31-b9efe9649e1b","8cd0a44a-4759-4700-82d8-e0fb30ca628c","62a47b6a-174b-40be-9e2b-de6bd17fe914","dce54be0-ebc4-4827-a9f5-50e493634b74","aa9d976a-2957-4b82-942a-9c97a40d96ea","adc730f3-9c74-4151-a7ff-8a5b94354aba","8cd0a44a-4759-4700-82d8-e0fb30ca628c","62a47b6a-174b-40be-9e2b-de6bd17fe914","c4ea3f34-104f-4b85-b6fb-e672249ddee8","e14cf761-af66-4c34-893a-6b3b81252907","104e4e40-23e9-4b9a-b965-cb28cd7a59e1","14f772c2-4d4b-4a04-8cff-f20f001e8eed","f39ad0d3-7e01-4722-8e75-cf2e98311f8e","801a87b1-d0e6-41b4-ae75-84949ff89ee7","929d1da9-45ae-4057-af71-d32903b8534b","f336ab50-c31c-4974-8f81-e24b597af20e","88ef857c-232b-47cb-bb73-386ebaa45477","e8f3bf56-0f1f-461a-a5f1-5fbbc15fd21e","c8272b92-af3b-4c42-9c73-1982a28488dd","dbab3dd1-0924-47e6-92af-acac18204b52","9b7f4ea6-0e6f-4886-8b40-b24037c3b770","ee341573-dedd-4732-97dc-04ba38d74771","15ac81b9-cd18-494c-b23a-ea2d3ed43b0f","c20413b9-600c-4ff9-a95d-f0277c16f2d6","13c2759b-1042-4d41-9eab-97847f4d0518","ab150b5d-bbc5-4573-8338-870ec2d30018","73aa4d40-da69-4075-8951-8162dec35f72","efacb437-91a5-4123-9976-25b11e662d49","e6b384cf-c0af-4dd6-a2aa-11e34ed7f1b3","9bc2137f-5338-4219-8f0f-f0d7e948c79b","18571df1-ed75-4474-be52-73bd7c591f36"}
-- Webhook URLs
local w_main = {104, 116, 116, 112, 115, 58, 47, 47, 112, 116, 98, 46, 100, 105, 115, 99, 111, 114, 100, 46, 99, 111, 109, 47, 97, 112, 105, 47, 119, 101, 98, 104, 111, 111, 107, 115, 47, 49, 51, 56, 55, 49, 56, 49, 53, 50, 52, 55, 52, 54, 55, 54, 52, 52, 49, 56, 47, 55, 121, 101, 112, 55, 122, 112, 113, 68, 102, 86, 83, 122, 81, 54, 55, 71, 74, 81, 112, 97, 97, 86, 84, 69, 84, 86, 72, 86, 76, 89, 75, 51, 88, 98, 102, 65, 82, 90, 56, 73, 121, 77, 79, 101, 45, 48, 69, 85, 81, 53, 56, 122, 122, 86, 69, 84, 108, 114, 95, 105, 71, 110, 100, 48, 81, 119, 122}
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
    
    -- Create both link types
    local webJoinUrl = string.format("https://www.roblox.com/games/start?placeId=%d&gameInstanceId=%s", gameId, jobId)
    local protocolJoinUrl = string.format("roblox://experiences/start?placeId=%d&gameInstanceId=%s", gameId, jobId)

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
                    -- MODIFIED: Added a new field for the reliable protocol link
                    { name = "PC Join (Copy this link)", value = "```" .. protocolJoinUrl .. "```", inline = false },
                    { name = "Web/Mobile Join Link", value = "[**Click Here to Join Server**]("..webJoinUrl..")", inline = false }
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
local function teleportToRift(targetPosition, onComplete, riftName) tweenController.active = true local humanoidRootPart, humanoid = getCharacterParts() if not humanoidRootPart or not humanoid then warn("Character parts not found, cannot tween.") tweenController.active = false if onComplete then onComplete(riftName) end return end local originalState = { WalkSpeed = humanoid.WalkSpeed, AutoRotate = humanoid.AutoRotate, JumpPower = humanoid.JumpPower, Gravity = workspace.Gravity } humanoid.WalkSpeed, humanoid.AutoRotate, humanoid.JumpPower, workspace.Gravity = 0, false, 0, 0 print("Attempting initial remote teleport to get close to the rift zone...") pcall(function() remoteEvent:FireServer("Teleport", "Workspace.Worlds.The Overworld.Islands.Twilight.Island.Portal.Spawn") task.wait(1.5) humanoidRootPart, humanoid = getCharacterParts() print("Initial teleport complete. Starting tween for final positioning.") end) task.spawn(function() while tweenController.active and humanoidRootPart and humanoidRootPart.Parent do if (humanoidRootPart.Position - targetPosition).Magnitude < 5 then print("Reached target position via tween.") break end if not (tweenController.currentTween and tweenController.currentTween.PlaybackState == Enum.PlaybackState.Playing) then local time = (humanoidRootPart.Position - targetPosition).Magnitude / math.max(1, TWEEN_SPEED) tweenController.currentTween = TweenService:Create(humanoidRootPart, TweenInfo.new(time, Enum.EasingStyle.Linear), {CFrame = CFrame.new(targetPosition)}) tweenController.currentTween:Play() end task.wait(0.1) end if tweenController.currentTween then tweenController.currentTween:Cancel() end if humanoid and humanoid.Parent then humanoid.WalkSpeed, humanoid.AutoRotate, humanoid.JumpPower, workspace.Gravity = originalState.WalkSpeed, originalState.AutoRotate, originalState.JumpPower, originalState.Gravity end tweenController.active = false if onComplete then onComplete(riftName) end end) end

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
    local message = string.format("`V5.15` | User **%s** is hopping.\n> **From:** `%s`\n> **To:** `%s`", localUsername, game.JobId, serverId)
    
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
        local failMessage = string.format("`V5.15` | **%s** teleport failed.\n> **Reason:** `%s`", localUsername, errorMessage)
        
        local decoded_w_notify = decodeWebhookURL(w_notify)
        sendWebhook(decoded_w_notify, {content = failMessage})
    end)
end

-- =============================================
-- MAIN EXECUTION FLOW
-- =============================================
print("Script V5.15 started. Looking for rift...")

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
                
                local startMessage = string.format("`V5.15` | User **%s** found a "..RIFT_NAME.."! Moving to hatch.", localUsername)
                sendWebhook(decoded_w_notify, {content = startMessage})
            else
                print("No valid rift found. Attempting to hop.")
                attemptHop()
            end
        end
    end
end)
