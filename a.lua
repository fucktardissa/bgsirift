-- Version 5.23 - Sequential Broadcast Fix
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
local APP_URL = "https://be31aba3-c401-464e-9084-f2b02e3cf599-00-23cpv2oivnb6o.spock.replit.dev"

local RIFT_NAME = "gift-rift"
local RIFT_PATH = workspace.Rendered.Rifts
local THUMBNAIL_URL = "https://media.discordapp.net/attachments/1371145746371579998/1387547415959179295/latest.png?ex=686303bb&is=6861b23b&hm=03a9b1ba1ee8fe38aa781f2580ba664d1be628313a5545a7f2b8baab64f3bb01&=&format=webp&quality=lossless&width=525&height=525"
local presetServerList = {"64fe7025-0150-47a4-8ad8-0f28099bb1dd","e272da5c-dcd3-451e-bea8-51d88d6a0383","2dfead69-6797-4043-9291-bfc01bec51e6","91dd0ef9-fe83-4774-803d-430172c2297c","42f48321-5161-4391-9714-333679b49e44","30fce92f-e744-4d7e-86ba-2891eaa028cd","90cf7937-f64d-41d9-a8c1-c2c27dc92785","1176242f-dfc0-4402-9958-438d75c2b923","c470ca42-22ad-466b-abbb-fbf9b3c299a4","75eb39a3-49bb-4b39-abbb-31d3118c6d08","5924fc7d-86dc-41fc-bd9e-4a224e6ae5fe","421c30ec-fae4-4fdc-83f0-00db5a81a283","ad203f6a-4cea-42cb-a5ed-cce935e51776","f82dc801-c8ab-4258-9daf-0d246724c9e4","1d476807-7e59-4cc3-ad48-2c4b020b98fc","8b428341-0ea9-443a-8cf4-3f31b6ad5a50","d4bf0326-c581-4fde-bfe8-8f0a13a028fa","83a979ce-ffdd-4820-ad9f-8d4bbaeeffab","f45048c0-b882-4e33-a1e7-11f773ed4f1f","1e144a32-3e36-4663-bbd1-f84bd31840c7","363e16d5-1c65-4ac2-be88-d5f736a1c0d9","0ac0de1d-499a-489a-a1e7-0683f7200c6d","1c5bf4e0-f9c3-400d-b389-f8b681ff70c1","cff51ab7-7591-4254-951f-0dba7924b2b2","a432b8e3-f661-4726-a08e-792c4ee1a68f","67698532-b7a4-4f5d-aea7-2c123903f1dd","abfbf0a4-03b3-4ecc-9646-2d8413936b16","a432b8e3-f661-4726-a08e-792c4ee1a68f","67698532-b7a4-4f5d-aea7-2c123903f1dd","abfbf0a4-03b3-4ecc-9646-2d8413936b16","bab8ff62-4d07-46c5-971d-7f469bdf49ad","959b024f-712e-43df-82bf-516fa46e4d3d","71264b81-1c94-41e9-a762-6e061d53ae0a","813cc44e-a50d-4b6a-bc78-fd65915411df","23802f34-698d-4c21-81fe-bfe6c364f18d","53239351-fc04-4fea-a091-3052b550cd1d","b02cc725-f409-4d04-99bf-fe4f0925af24","5aac9bf6-f825-433a-bbea-05c9a7dbbe73","7a7bd5fe-800f-454f-8769-78594b4f2d75","9479e8b6-7e96-4b68-8ec6-0e36c3a93ec1","d694c596-4837-4c68-a48d-fcf58a0d4d50","c9af834f-ac12-4d73-b5ea-deb693392751","21f5fdaf-1fd4-4e5f-a553-fe23662e6cd3","96f34571-e8ec-4ccf-a5aa-9b4bef65fbf9","62a47b6a-174b-40be-9e2b-de6bd17fe914","aceee4cf-4f57-4f11-949a-28972083e238","c6587cc6-5597-4c82-9ef1-cf86b3ce61a2","ddb4fea2-7bc5-4f2f-8a97-399453d163bd","eb7a69e0-23bb-4fa2-8a47-a4246c0ca090","342f9d65-b8bb-4d60-9cb1-8bc6ec199272","795d4463-e0fc-480b-8cb1-cf282ac03bfb","3eec3e48-225c-4b57-bfd7-58d23b0d15f3","4988f9fb-b86b-4df5-9380-f8d8e3666463","1f9268b1-8e43-43cc-a23c-9f0dfc40da6c","e88c36fc-96af-4ccc-8689-e1d72dcfed01","99962a8f-33c9-4306-a02e-4258508f0af0","acb37814-d820-4f70-b66f-884f17445f1d","a0f27650-5dfb-4aa7-9b90-70ebeae10251","816f125c-9e73-460d-9295-3582ed77ee14","17fdce0c-4e6c-4d95-ad7a-2b4b7a9db88c","929d1da9-45ae-4057-af71-d32903b8534b","8c61cc54-6ca6-40a1-8074-6723f8eef4f4","1085d27d-0597-419d-84f0-660705835941","9e065965-aa7b-4eef-bc43-eabe3674c2a8","7af5066c-ef82-40ed-a3f6-7b56d51ad6c4","8a463df3-e496-4043-bcf9-9f16221b6ae3","aed6821d-22fc-464b-ba63-7fddb1698d20","e4e2e624-5a68-462f-a083-44b4129d7a0d","28f0741b-9694-49fc-8680-49252f6ae559","45c9947d-49e7-40bf-962b-e65e18d18835","bd1a7e77-eb75-4c0c-a2a6-1fab0630b5cb","3033ea01-937d-4b88-a9ee-fc6b660d4aca","3cff3238-7dc3-4f23-97e0-172b27ae34cd","8c32d910-5969-4c1f-9d2c-d443b8d71cc8","89fc4939-56ac-4c77-a28c-cc3aee9b8d97","2a036885-2dd8-4f03-8dc1-0c3bb80921c2","0752c0a8-65c9-4bb1-9b1b-83f1796ef33d","670f488b-95ed-4174-a29b-b26b7247fbbe","766bed05-fba1-494a-9987-1b2c4d0faef1","f336ab50-c31c-4974-8f81-e24b597af20e","b41ced7c-bfc8-4ca8-aae5-0b146cc64de3","aa6874aa-abed-49c3-b487-eed70ea2baaf","6d6f23a8-63f3-4a04-8493-6b983660e764","b2585df3-7df1-44da-bd4e-50e0997d66ce","a6780c26-2206-43df-8757-22ca22e7dd71","4c52e699-ae90-4859-be29-57ccfaf707a4","7ac556e9-3b64-450b-a93a-8cfb759d2c69","a8e087c9-ad60-4cbe-b836-6b358c50b411","38ab9ef3-3db8-4e1a-8714-d5ab12af7a3f","59785750-17be-4117-91ee-1f5765937492","efe7b52f-36c1-4511-8910-4e64f7ee674f","ed26c87b-6fec-4f43-a3b8-38920d9e2f3c","2aad492f-5ecf-45c4-8a20-065f521337f0","fd2a1168-3f99-4d6d-aa28-ec47a58d3bac","06b26cdb-649d-4ca1-9522-5376c6d6ee30","4e0a4af7-37be-4c9a-85f1-dcee83648f03","23bfa042-dc29-4616-9692-e1c278bba747","03179e8e-310c-4925-815a-c6c108139539","790549ec-b730-4f78-89cc-68d52b50ce3d","bd62d8b4-18da-4837-95e6-99546b61b6d5","7593e4a3-c4aa-4409-b585-5c8d720a828c","27b60334-9c8a-4be2-9994-4ba71543e5ca","af7021b5-f7ac-4b67-876c-c32f551cfea2","3c407c6a-87b9-4450-97de-1a87024ee379","4561fb48-7ccf-4316-8402-b00cd7695e6a","9b2eaaef-2fb3-4456-938a-eaa9c4a2bbeb","fa2ec485-519a-4a3f-8557-dd6311a0ff22","97469726-9b6a-4fb2-adcc-44391d43bafd","3b0d9d87-0b51-4769-b14e-dd87a0f5cd8a","90d468d3-7aaa-4351-887c-3c5780dc2d7e","543883d3-49c5-43f3-aec3-a6a8e016cb7d","16513e44-6a9e-42c4-8ece-54298b7f1a2b","82083add-17af-4739-8a53-3dae844043b3","0a1159a4-2a31-487c-8200-f8dd8907cd9d","87388dfa-2f77-4255-9bc5-7c9a8ffda2ef","b2779f66-8460-4f14-902f-ae029490c0b2","0428a541-29d9-4de8-a6f9-082ff17c0c4a","0885cec8-0ce8-4471-9d34-c15dd713623a","c9bd63bb-5043-4606-8bad-243a86adc7e5","a9a6e833-fea3-44d3-8590-676957daa319","6decffd5-30c8-4b25-b4cf-1c9d38c27dde","1b0e9d6c-0d74-443e-b3f7-a0c753c433e3","14f772c2-4d4b-4a04-8cff-f20f001e8eed","f77afa81-130a-45b4-bc00-5ad928334bff","79609d1b-6fae-4471-9b9a-41d73eda1e3d","de4fd26e-301b-4810-be1c-4bf3d7a8794a","f4f451e8-ffa3-4c9a-8fef-6a3f2b25579b","f4f451e8-ffa3-4c9a-8fef-6a3f2b25579b","6d95e21f-0683-4dbf-bde6-ef2d12ed2a80","48574bdd-2bbd-4b64-a23f-d768d850d350","fd6413fe-8407-47b3-8a6f-e2686af8a0ee","4786830a-ab8c-4057-8d86-17c8e92667e0","4f2c7960-cb1e-429f-8e28-295ed3f12ee9","dadfa5bb-3398-48fd-a8c8-ab292d7f0555","6cf312b1-40ba-4618-91b0-43012e000fab","a9e6d083-4691-4432-85ea-07c9a7b4bf59","b195bfd0-0d58-41ee-93c7-a032ab7475a9","6c36b9df-b72c-4977-815b-9a110f64cc9c","5cc2f95e-e3e3-4958-8dd6-20639f2c658d","75994d9b-d059-4b9c-8aad-8642e438d5d7","8f69acb5-e35d-4b69-8587-b7be7cd21f11","1c839284-7d81-4a78-b5cf-aaa8a2586112","bf28dcae-750d-4c5f-9410-7f35c0193296","5b34030d-0884-4033-973a-1d2faae7ff9f","e91e16c7-cbd6-4036-b7ec-075f23ebdb98","8ad46a7c-570d-4510-beeb-1c64c6e78d00","1173100d-e41e-4da2-9085-b51c0b74cd08","283fbd07-ba80-48fe-ba1a-1f7fa470e0b8","20fa4b97-4000-49ff-9ebc-25cd38702863","1dbf2dbb-7e99-4153-a21f-d4e8ce1fafc4","0bc70e8b-b5d3-4eff-96ea-f78f0bb86c3a","f8763f37-6bea-48e8-b267-43f6167f4a33","11cc863b-703c-4542-b05b-5d54e135ffd9","d4092db2-71e4-405e-b8c6-cf4557b8d971","dd834276-bbbd-4565-85ad-225f3b44b579","81cb8610-0116-4ca2-9b2c-0021a8ac7418","a052b049-553d-473f-82ca-08b39ea06730","ba4b08ca-d4c0-4270-a7e7-459ed5a1c643","bc5ed925-7ec7-4b63-9442-a826e915c557","53339bd5-4015-4e36-be3d-1f0759aaa23a","dbab3dd1-0924-47e6-92af-acac18204b52","6a8e7e59-e3be-4bb2-ab79-cca8330242f3","85c927a6-2850-4955-8450-e4a199868caa","c1768887-2ccb-4fc1-84ed-83d3f09d534b","a696106d-3f13-4dc2-8c95-fbb6e01ebf2e","0fd313f2-e92f-4e59-a5de-bbff78916c59","11b3bf6f-b16e-4992-8829-3f93d0744cfa","d5fa63b6-fff2-4fdf-841e-4f620c2bd0a8","37852226-6c91-45f6-b261-4388a30f863d","2273a748-35b0-4fa7-8f49-9188be5c518a","89e507ea-85e1-4458-bb0c-6fbe8012f443","557bd26f-c7e2-48c0-8a95-a01eac3964d9","65ed3ec2-8a13-4f2d-b629-d10dc2980db3","e1615f2f-81f7-4fa1-bca1-838d8db02e8f","f012be9f-0518-41ce-96c8-a7b043b871e4","dafca535-ca96-45de-9d65-cd4b5a8c7c1d","86c6d97f-a716-4dc5-95fd-e2dcc7459139","6c879778-f51b-4689-99b3-2b3adcff710f","6e2e94a9-4a2c-4671-83aa-d07ceeab7ddb","e737313d-929a-4798-88b0-ec5fd97efeb0","420d463b-4e51-4c25-a84d-48a5171a652b","38f16069-0696-44a8-9dc1-fc445795ac93","94ef72bf-d375-4034-b9dc-86caeed847cb","4da1b6c5-9981-48ab-be78-b7a795bb006b","a591bbe3-9e8b-4f85-bbf0-92b9d11a4826","b9557dd8-3e9e-41b1-93fc-7b110023d859","e63b9b0c-df15-4ba3-a63a-fe4b94f8835c","54a58aa6-7e54-4ccc-90a0-391059f3ae1b","c2ac6e39-e7db-40a2-8b4e-42e28faf13e4","76f1d872-ae6c-4fe5-8d1f-cee02ec5a649","4a65ad04-e8d0-4db3-9895-22c9df9d65ae","8ea53a15-1d06-41fb-b747-adbea24fcd0f","e8552f0f-bc72-4639-a3e6-b939518b53c9","2c8093c9-ce92-4b62-a070-01d034c1e1a2","7d45e599-36f0-475d-b394-21c03855b1fd","50abb7b8-9319-41be-88f5-976a4ed76268","76b8fecf-c5fc-4cdb-a235-73f97031e9e4","09907af5-d2af-4e5f-8914-a8eeb8b98889","58c18fb4-fff8-437d-b721-e0659e1ab954","c6f8c746-0941-4f84-914e-ec054b79a682","ffb849e0-b09b-4959-9a01-4516e540db8c","51e2e946-fa8a-4bd4-a105-215436b07cdc","5c51e7f9-ec5e-4807-be45-b054ecd41a8a","a17708ce-efb7-401c-bf59-261755e07fc4","7c6a9193-464a-4568-a7de-4f46ff4c2ca3","24e45a95-29b4-4c29-ad46-6d8577821302","d897b3f7-978e-4044-9454-d0408d6ece46","7198dcee-4551-44de-bf2f-49f12b4f0c8d","0bb298c9-f240-43f8-b17f-fd3182a015c0","15142af8-bf12-4f7f-b899-63a80d03f0f7","c16d1eb3-86b7-40b4-91c9-6e75a4241886","82b7a89e-979d-499a-a96b-a348ba15c2ec","b1e9380c-6053-4d16-96d8-f4c003053304","36cb98a7-08f1-4131-8a38-c97fb02477bf","5b2cf2e6-fa96-42bd-b964-e996bb68b5ea","e49833ff-946f-408a-aeb0-b427fb732c1c","2ee8b406-fb73-423d-8df6-e98c22f46af1","cfb9d349-95aa-48c5-b84a-6f645ab793be","bed22d36-9d0b-4dda-8b85-b5fb5a1042f8","6124b93e-a936-4829-85ad-0051df5ad897","fbd984b2-3884-46f7-8123-2518680f27bc","af3bd5e9-1076-4301-97e0-dce344384c79","2a0660d3-1154-4117-a094-186590ac42c0","3ad68422-0c44-4d87-9638-5748aa3aabea","a2129a08-4604-4d10-bab1-35d2cc45ad79","efacb437-91a5-4123-9976-25b11e662d49","4a8112d6-3454-4109-ae26-ccb6bc658880","efacb437-91a5-4123-9976-25b11e662d49","4a8112d6-3454-4109-ae26-ccb6bc658880","307cb6df-06e7-438f-8331-4b281a550cb2","88ef857c-232b-47cb-bb73-386ebaa45477","125baeea-0ae6-410d-9053-91d7a5e9671c","057c1796-b9c1-4971-9e70-facd9c323ae4","2acf26ee-8783-46de-9034-60648bc0cf5a","694cf4a1-2a40-436f-968a-0d4fb13a6585","3d24ef33-9b86-43b7-9e00-b5c398d5404e","bae7756a-49cd-47c8-aef8-ac95e556f877","44e76d52-0128-4e5f-8e24-a55aa4b30c59","89003d93-845a-4f03-8cb9-2bec9c7bc2f4","cdf0bd14-d489-42c3-8125-f6d752c1f771","238a2f25-d5cb-4ced-91ce-897fc1542ac0","c0fd7a68-0365-4da0-b08b-cc819c254d42","e3994ece-6f16-4e8b-8d6a-2a2371f41d72","bd8666c5-d119-4496-845e-253a2a26b4f5","6b8c7524-cd4b-4475-a354-2a7a3f485161","468e6b8c-6eca-44e8-9f4e-e4368d7b0910","9f3fa497-4b68-46c1-9b7b-bde76497ac6d","3c62a676-ee51-4539-9b84-d2a6244999e1","b19b6ac5-b538-4d7e-8251-8aaa086b6908","37eb4d83-4836-4536-8093-624f460660b9","894b4eb5-a372-4241-886d-78160ad5b1f5","b7ae1ab4-da89-4511-b891-e7c33d0589da","ef0009da-664f-4254-ac52-2a7ad398e39c","22931cf2-2055-4b86-acdc-cf6377e14fc5","602056c7-7be4-446b-9e84-3c826c62a5f8","37212a59-22af-48fe-841f-d752158894de","25426dff-4c7c-4241-96e9-005678bdfad8","5f8706f1-de67-4ec6-a92f-517e1fca0de0","19b18d4b-9c74-44f9-bb06-ea8efbef7598","07af3b87-c35e-4319-a866-12d8e077fa6f","063be9cd-c657-48f8-b881-99b7b7c8a2fe","d2d4fe38-2dd9-40c7-bbcb-13a98c5aa592","aba6e20a-6790-4b4b-b7d0-3462f7cec126","72862f6e-28b2-4599-972d-accba866e777","55a65dd8-0014-46a7-8e26-697d19e82a18","524d6fb8-e868-455c-88ee-c67d57c828ee","ed481fed-d388-44a6-af87-2b8b4ad076c3","31950041-72e4-4d58-b67c-e7dea2d57b04","779b91d3-0b44-4c2c-a166-df732d242104","efae1e24-a3cd-4b0b-878f-ae94deef5dcd","998c9dfa-d679-435c-a93e-cee709d53e9f","4a2060b3-dc67-4711-a534-7057c4268817","74c4c9a6-244b-40c3-9f7f-096330240cbc","ee76bc13-f4f4-4509-8c53-b06f844c6fc0","e8502b13-3b11-4d2b-9d4e-62961c32650a","0a0d9a06-3ac4-4ba5-b63e-6dfc029785c0","b22848fd-8829-428b-9eef-2cff23814806","968c8803-7c0d-43d7-aa60-e1435852eec6","9820b053-d4b2-457c-b75b-831ff9cc2b02","e1a27c3e-b8f2-4317-9395-eb4b85ea6ce6","63e5a075-e60e-4158-a0da-9c9b334bc3b6","8b48552e-83dc-4426-97dc-24c792fda83a","4beedbbe-ebd8-4257-ad0b-8c27e73fe07f","2496b493-3abd-4cfb-bee5-43f35d3d073f","0cf49b45-903a-4e5d-98ad-2446df203240","c4ca0580-10aa-4e38-bda9-7e2286429b81","ce9e9cbe-7718-4404-be77-39be831fda36","6c03584f-41af-4df0-a073-e0973b9cea9c","c0140886-0687-4c42-b466-7b86ee46c03e","579f1215-5d62-4264-923b-5aea17155160","4cd0538f-2f2d-4481-873d-0e367b2eaf22","3e7f52f5-050c-4102-9435-d0c9f49903b2","836d1bbb-39a7-4cf8-89fc-560b6b3de55a","c20413b9-600c-4ff9-a95d-f0277c16f2d6","48b9e353-396e-44c4-a0dc-827575e33509","e14cf761-af66-4c34-893a-6b3b81252907","6cf6a295-eaf0-49a1-b05d-6b121f611d0e","6715764d-cc61-457f-ab86-bfb07d3a13af","056c38fc-c82b-4d1b-bed9-c1ea450aea46","a2b40683-9eb5-4940-a4e4-8368e77055da","3024a063-7c0d-499d-9660-9ffdd64c8989","6652309e-8b82-493d-a414-7cffaf039cd0","3b3ef919-41a6-4cda-a3c8-21bf4955b828","ab18f362-83f8-45ee-accf-85cc119c929a","c21584e3-854e-43a0-a23b-023753920b07","7d9f7e77-37c3-4b56-8642-b5288f482a03","ca0263d8-63fc-4159-8ed4-83bbdf77ef74","98168b25-bc8f-49e4-bcea-c5ea0baf2d13","342ae992-9751-4858-9fd7-f95a4a822462","4040e4d3-c133-4d48-869c-187678504e5c","c92f86b1-7fb2-4e30-9fdb-b40736a768a4","1f0ea379-b3f1-4a1e-ac1b-c45b9c050d61","79dac78e-f040-4cf8-ad76-13a6d897222d","f3ba5f52-da55-4db8-8900-5799a69f7117","e07acbef-b473-4ab8-98a0-0423d2d8f387","4b42a78b-b6d7-4dbb-8154-d22910a5f09c","75b676ee-5c74-4ad1-899e-6afc94e2b1c0","5532585b-3b4b-4b03-ad14-9470611d270d","c7f9266f-488d-4f01-9171-27ee0430988c","a370af27-73f1-4678-a70f-60619d7a1417","30cd8516-75f9-4df5-a742-f927a1ce4ca7","3111f53f-3fea-4115-b3b8-75c09db79a0f","70a1db0f-8106-4e54-9339-540749aab4b6","87604f33-3b8f-4036-b473-113454b95cd5","683278fb-8117-4a39-bb5b-e23a1fe9ddac","ab150b5d-bbc5-4573-8338-870ec2d30018","16a5f730-ecc5-4311-9137-18c218c6c66b","c7f9266f-488d-4f01-9171-27ee0430988c","30cd8516-75f9-4df5-a742-f927a1ce4ca7","70a1db0f-8106-4e54-9339-540749aab4b6","f3ba5f52-da55-4db8-8900-5799a69f7117","87604f33-3b8f-4036-b473-113454b95cd5","ab150b5d-bbc5-4573-8338-870ec2d30018","16a5f730-ecc5-4311-9137-18c218c6c66b","d1013585-b866-45d6-a40a-0d9c7e15810f","17e80040-215d-4f57-951c-b04e235bf0db","2430aee2-f643-44ee-b747-eec6e5d48498","2547938a-59e4-45d1-9d2f-f6aac68e603e","d55fd32a-9b38-45bd-ab7f-830c52f290f8","00b8cf2e-844d-4fe7-a10c-0bba1c6b7659","96f9c6ce-f556-4ef2-8979-2bcff9f42f07","8b98598b-3a4d-4bc2-bb8c-761dce4f988b","ae92294b-595d-4db6-97fa-30b251c50d5a","6ea7de2e-1271-4e1b-9483-2358f138a6b1","967837d7-12cb-43b9-bf83-abdc48146856","3cbf5988-4fab-4269-9419-0db64ab741a2","3f2b829d-b245-4440-a940-3a6469fd0db8","3fca538d-5433-4ae1-a9ba-7eaaedea8651","3379bfeb-0f4b-4b89-b2ee-89b6fbe560eb","6d9d1ff8-b2ba-4f58-b30c-814edd936800","d4a69b60-f715-419e-97f9-8f2428526ecd","ab6475b5-8e87-46de-9db5-3d56f0272d35","a6ee65b5-2f3f-484c-8350-5e699fc96bf3","f9c9aca6-8642-4a3b-8807-effea45829dd","9e3a1cd7-d933-42aa-98a9-fe6260241c9f","3197c22e-9249-4691-8e60-eba119fa23d2","1d1a0af0-af59-4e77-86c5-ab35262c6f83","b8c62ebd-d989-4d78-987d-71d88a7245b7","c6b9a1fd-6da2-42e2-b4e7-5e316379cd96","06dba9bc-a845-4b77-86dc-2f22ad10154b","df395b43-d5ab-457b-8dea-4d67e3cff352","9675457d-72d8-4020-8568-fba51023ece6","dcb223b2-b172-4852-8883-41e9e0b7260e","e84b9ed9-9649-4b80-8b9b-3e8c2f217b81","a6945ef8-597c-4316-b63e-11b5762f44ef","870519cd-f6cf-42a6-bb30-3926c8223e81","ed1164d1-d970-4f2c-a904-834d276e6e39","451ab95a-3d86-4aeb-9286-acc83d77f7b1","71fc06f8-9a84-4e2d-8f87-d7f07b3bd334","11e4c320-b08e-407e-844a-4e4486a00abf","f55413f8-c4ba-44f9-b651-fe9680c4cab3","400c638f-6bfa-46d5-bdee-d421d7c187e6","f88655b3-beb2-48dd-9dcc-c4715432e406","f23dd735-fe32-4482-9cd2-0825acafae04","70ae443e-3ac8-4424-992e-31420efef65b","66c2a70f-6e81-439a-bfea-a329b8b15cc0","dbe3aa02-770c-41e2-9e17-8d366d21ed7b","4ac35cf7-7764-4dd7-bef1-2e2b8dda8e63","a5cb85f0-9981-4c1b-8778-1ae3a513f532","a9ed5850-7a68-4855-8391-c64abb528da5","f641deaf-c41d-4f3a-9358-59439d3bf8c2","0a8fa519-bab5-4611-a8c7-ee6c9a9b7807","00c624fa-22a4-495e-94a0-b2377ffa0f04","f41e7509-0d88-425e-93ce-d61aad8d3535","240a5604-7384-432c-bdf5-601aafaad95c","d5218890-4a76-4366-adcb-672a854ffc48","eae3fa68-97f2-4877-b1a7-4f4a820c1532","c388215c-7dfc-4413-8b2f-29899bfa8a0f","e0f198c3-18d1-46b7-9e0d-f9e31d76e81a","11dc8ffb-a89f-4c84-9d23-0557a2a7f1e4","96e5f146-cb8b-4bfe-825c-30b5a1a10e44","15ef86a7-0173-4068-9368-7cbcae5b6cc5","8c2c06dc-0446-473b-a79f-38aaa4334f14","7684743f-f301-4d07-a4aa-4724cb523b87","a47881e8-df94-4d4e-99b9-bf7fb623b3ae","b3f62081-462d-4bb8-a915-3d1d59c9830c","1f05fd7f-2236-4ef6-9677-2a694c54519d","7e49ca76-9899-4820-9596-aebaa8172584","e2d33424-c98c-447e-bd74-3193d2dd822a","d1730ccf-9518-4798-a24c-1795408feb35","eeaef93f-b203-4415-8d4e-3c531bd758b0","00ff6206-6c72-4805-91f4-6083b171fde7","51920a91-3a07-45d2-84ff-d5a01bd9d2f7","e7a8695c-de4f-4658-8292-03d7c69b91ec","a33cf6b3-8d1e-4bcd-afa0-04a82d629367","3c729e51-5533-48d1-a854-5344961ea03a","949785c7-0e81-4bb6-a0b7-64e3370c299e","26809c7d-19e8-4b87-a093-b6aab5d4d9e8","eee732c5-27d4-45e8-8840-120ce8336f94","cc997903-2a78-4920-a0e7-1c74cd7f074c","68af4119-e10f-4eb2-80fc-e99380a554cd","b8897c2a-3cba-4b75-befe-72bcf676fa43","bc42419b-e24d-4644-bce5-d118c5b98c51","3bc42358-3ea0-4383-811c-7086a281e835","dc5c1f6e-c5e6-43b2-9356-bf238014d8f7","c536dd63-4319-48a7-93e1-c02c589f697c","37d4762a-eddd-4c92-a4fc-5b512cdefa5b","2ac651fd-5839-4e2a-9eda-14d4cdcdc832","cf5b350c-b966-4685-bac1-75dfe4ea287f","7ea459d4-19ca-492e-9a5d-13bfb4a2950b","c53d737f-2f5e-4491-a329-b7c2d035e935","803feb1d-4fd8-4333-a888-49be4da10476","09b40e5f-2c2d-4b5e-9019-4fc56f10e78c","478fa718-7485-46bf-8718-fecc62c275d7","a95ded2d-4534-4951-8dc9-cc15e5600178","0ac911c3-1ab3-4a60-8007-7833dad00f3e","1b9c9760-13e5-4cc4-bdde-4832c02b6652","7684743f-f301-4d07-a4aa-4724cb523b87","a47881e8-df94-4d4e-99b9-bf7fb623b3ae","b3f62081-462d-4bb8-a915-3d1d59c9830c","1f05fd7f-2236-4ef6-9677-2a694c54519d","7e49ca76-9899-4820-9596-aebaa8172584","e2d33424-c98c-447e-bd74-3193d2dd822a","d1730ccf-9518-4798-a24c-1795408feb35","00ff6206-6c72-4805-91f4-6083b171fde7","eeaef93f-b203-4415-8d4e-3c531bd758b0","51920a91-3a07-45d2-84ff-d5a01bd9d2f7","e7a8695c-de4f-4658-8292-03d7c69b91ec","a33cf6b3-8d1e-4bcd-afa0-04a82d629367","3c729e51-5533-48d1-a854-5344961ea03a","949785c7-0e81-4bb6-a0b7-64e3370c299e","26809c7d-19e8-4b87-a093-b6aab5d4d9e8","eee732c5-27d4-45e8-8840-120ce8336f94","cc997903-2a78-4920-a0e7-1c74cd7f074c","68af4119-e10f-4eb2-80fc-e99380a554cd","b8897c2a-3cba-4b75-befe-72bcf676fa43","bc42419b-e24d-4644-bce5-d118c5b98c51","3bc42358-3ea0-4383-811c-7086a281e835","dc5c1f6e-c5e6-43b2-9356-bf238014d8f7","c536dd63-4319-48a7-93e1-c02c589f697c","37d4762a-eddd-4c92-a4fc-5b512cdefa5b","2ac651fd-5839-4e2a-9eda-14d4cdcdc832","cf5b350c-b966-4685-bac1-75dfe4ea287f","7ea459d4-19ca-492e-9a5d-13bfb4a2950b","c53d737f-2f5e-4491-a329-b7c2d035e935","803feb1d-4fd8-4333-a888-49be4da10476","09b40e5f-2c2d-4b5e-9019-4fc56f10e78c","478fa718-7485-46bf-8718-fecc62c275d7","a95ded2d-4534-4951-8dc9-cc15e5600178","0ac911c3-1ab3-4a60-8007-7833dad00f3e","1b9c9760-13e5-4cc4-bdde-4832c02b6652","5e9fe91f-cc2f-40bb-9fe5-7ca19bc227e5","b4972ab6-c935-44c3-88de-36267be5b8bf","6287d39f-2db4-4315-bf53-ae2dc1a7cc17","c2eb740a-ebdc-4948-ae43-a7d0a99a1aac","5be03d60-2c4f-4e21-8269-6ac53a5f3c01","d9e0c8fd-349a-4fa7-8cbf-f58c3d39e134","e54b3834-2323-490b-a445-fa14af5e0ed1","c259d133-30c7-459a-ac78-d30f7abfc5a7","c18d8c10-1494-4466-a09f-ca0506ca6e6c","23230449-0928-4c1f-8f4d-ff6474221967","00bae54e-103e-4835-a13a-30499b00c767","f9258c44-fa81-4cdf-8cb2-da6e494240c4","e24f70d9-0305-4255-8ceb-0a9790eac6de","f44cd873-bff1-4af2-904e-aa1d1c25e003","fc075600-19a0-4357-a949-27948a5fbf14","b0449c98-a78f-4f25-8804-dacc3786598a","4c2a285f-0d45-4336-897c-de2ec8a7d439","795c9c77-b2a0-40ce-b529-bb30ee2ba3f7","fd23ff85-7942-479f-877d-407b81b848a6","e8c69de9-7ced-4100-8967-d5b567e9dee4","b44ff346-92da-40e6-b21a-67e2b49939fa","22c499a9-ce83-474d-be00-6cbb2a1fa62d","e277f638-a667-4fa2-bd50-90328168b8a0","642c9b53-2791-499a-b24a-561ae233e9eb","4df0da17-6bb8-496d-adae-dc8d7910ed87","e478a5ba-747e-4f78-968d-cffd095846a2","1f61cc2f-dee2-4b6a-9e86-8ec36718148e","7f759b8b-f168-491b-9e52-072c15b101d0","744a4612-5cd2-4a8d-8346-1e5a3ebdf85b","e4422b3b-e73d-4c4b-bd39-0beae2389f6c","d774a694-1001-4836-8c7d-934480635323","583c4cad-749a-42f8-987d-e622ec68ace1","8787ef8a-d43f-4c6c-804c-f6d49ecf8f4f","12a0c784-311b-491a-a57c-b2ba8f199ce7","0d4604a3-d2b0-4780-a14d-7637b08fae6e","add326fa-3bf5-46fe-8350-b2a6e6153105","5ad4ecfc-9fc7-409b-9457-f6fb84fc8583","b12055c7-5df9-4285-bbee-bfed3ba22ede","09ca7340-0c1a-415a-8fcd-770ee727cb04","83392279-f901-4643-bb7f-16eaa3cb6a73","475e943a-36fa-4e40-8ffd-67d7b6e283a6","c85cd6bf-601f-4529-9d82-866053ed7a5d","b713d1db-dafd-4102-9c4a-bf4ccdd9527c","04db2c20-3c80-4208-bf49-37a108cb2df8","0228d336-bfd8-47b4-81ec-d982ee728cf1","05b4b7ae-3c7b-475e-9e49-b4b1e46b43ab","671d4cdf-9817-42ba-9049-3c8f680972dc","78b14fdd-5f72-4a7d-a07c-f9f1a8539258","afeb8cf9-4eb2-47f0-b9a0-a70b12d857ae","62eb6dc7-4135-4355-a788-ef794fd4525d","afc2c493-d2e0-4db9-a28b-42346dde2910","f56833d2-f0dd-4d75-a2d6-87e38a2f1bb0","f7db1ade-5ddd-4d29-9d1d-3899ea703079","4562927b-4040-4bde-acab-cede91bdb974","894fa34a-1404-4e0b-ba68-38e3c9d503ba","20e653ae-ffe8-45a4-a961-375bf21be3f6","898f8adb-82ed-4534-ac4e-1019154763ce","20a3fd44-a273-4f98-bcdc-2d3f75c95c82","ab619b66-d4b5-4471-bd96-8fecc524bf06","15ef5114-d68d-435e-a9d2-0fdf24157247","fee1338d-b9d3-405c-b05a-67b9e45fdf05","a0e08677-eb3d-4ddb-807c-00b15b51afd0","863027c6-ffe5-4ed8-91a3-23949a6929e4","ebc744de-e7fa-4fc0-9aa4-43f2316ccaba","17a4d1da-b928-497b-a2df-21c6843db81b","d62df8ca-91b2-4e99-8278-434a842396a0","20a3fd44-a273-4f98-bcdc-2d3f75c95c82","ab619b66-d4b5-4471-bd96-8fecc524bf06","15ef5114-d68d-435e-a9d2-0fdf24157247","fee1338d-b9d3-405c-b05a-67b9e45fdf05","a0e08677-eb3d-4ddb-807c-00b15b51afd0","863027c6-ffe5-4ed8-91a3-23949a6929e4","ebc744de-e7fa-4fc0-9aa4-43f2316ccaba","17a4d1da-b928-497b-a2df-21c6843db81b","d62df8ca-91b2-4e99-8278-434a842396a0","38942d52-0e82-42aa-825b-44abecb1f727","d2338185-fade-4d44-81ad-bcd664bbcbc8","e9e42477-ad09-4eaf-b013-cac6e890b4d5","31861150-cc44-4285-9a33-67a4d02a4f0a","98c2b966-7dea-4a11-a199-389693182a9e","bde4c1e2-8b61-433d-a34d-9383a510527f","cd0bc365-ac65-4b27-be0a-b2c982dfe73c","3f2b829d-b245-4440-a940-3a6469fd0db8","22c322fe-9e5a-4699-be7d-effc9482cb44","cdb1aeb2-53a3-4ce2-89a2-91278b20d09a","2c8093c9-ce92-4b62-a070-01d034c1e1a2","97469726-9b6a-4fb2-adcc-44391d43bafd","c418f4af-866c-43b3-bfb4-577735adb584","3379bfeb-0f4b-4b89-b2ee-89b6fbe560eb","108497b6-1bdf-4fff-a2f0-38ab2cd580b2","363e16d5-1c65-4ac2-be88-d5f736a1c0d9","26161bec-c0b0-49b4-849f-760b2110de68","9d6037c0-8aa2-468a-a62e-3423f7c5b270","91fe4e95-8c0c-46a8-9073-6714301076da","a8f7bef2-688d-40c8-b014-969bb67e1f65","ded5d232-6def-421f-9b27-982811375d48"}
local TWEEN_SPEED = 200

-- All Webhook URLs
local w_main = {104, 116, 116, 112, 115, 58, 47, 47, 112, 116, 98, 46, 100, 105, 115, 99, 111, 114, 100, 46, 99, 111, 109, 47, 97, 112, 105, 47, 119, 101, 98, 104, 111, 111, 107, 115, 47, 49, 51, 56, 55, 49, 56, 49, 53, 50, 52, 55, 52, 54, 55, 54, 52, 52, 49, 56, 47, 55, 121, 101, 112, 55, 122, 112, 113, 68, 102, 86, 83, 122, 81, 54, 55, 71, 74, 81, 112, 97, 97, 86, 84, 69, 84, 86, 72, 86, 76, 89, 75, 51, 88, 98, 102, 65, 82, 90, 56, 73, 121, 77, 79, 101, 45, 48, 69, 85, 81, 53, 56, 122, 122, 86, 69, 84, 108, 114, 95, 105, 71, 110, 100, 48, 81, 119, 122}
local w_member = {104, 116, 116, 112, 115, 58, 47, 47, 112, 116, 98, 46, 100, 105, 115, 99, 111, 114, 100, 46, 99, 111, 109, 47, 97, 112, 105, 47, 119, 101, 98, 104, 111, 111, 107, 115, 47, 49, 51, 56, 55, 51, 48, 51, 50, 52, 56, 53, 52, 52, 54, 54, 49, 53, 49, 52, 47, 66, 86, 109, 72, 114, 105, 65, 117, 104, 118, 52, 79, 89, 83, 107, 51, 67, 87, 75, 102, 65, 114, 109, 121, 87, 116, 110, 110, 90, 67, 67, 85, 108, 78, 89, 115, 112, 49, 85, 99, 76, 86, 52, 69, 113, 76, 53, 115, 65, 103, 101, 90, 108, 117, 99, 68, 95, 52, 117, 109, 50, 79, 114, 100, 86, 116, 98, 86}
local w_inviter = {104, 116, 116, 112, 115, 58, 47, 47, 112, 116, 98, 46, 100, 105, 115, 99, 111, 114, 100, 46, 99, 111, 109, 47, 97, 112, 105, 47, 119, 101, 98, 104, 111, 111, 107, 115, 47, 49, 51, 56, 57, 48, 56, 54, 52, 56, 52, 55, 51, 50, 49, 56, 50, 54, 52, 56, 47, 102, 73, 106, 54, 88, 108, 119, 68, 100, 54, 86, 85, 109, 95, 119, 57, 68, 77, 57, 89, 103, 83, 70, 54, 109, 114, 99, 52, 104, 103, 83, 48, 89, 113, 97, 103, 69, 80, 117, 51, 52, 82, 118, 65, 52, 102, 73, 50, 113, 85, 105, 87, 103, 80, 68, 100, 113, 102, 48, 75, 121, 116, 49, 97, 68, 119, 98, 109}
local w_booster = {104, 116, 116, 112, 115, 58, 47, 47, 112, 116, 98, 46, 100, 105, 115, 99, 111, 114, 100, 46, 99, 111, 109, 47, 97, 112, 105, 47, 119, 101, 98, 104, 111, 111, 107, 115, 47, 49, 51, 56, 57, 48, 56, 54, 52, 50, 54, 51, 52, 55, 51, 51, 57, 56, 52, 57, 47, 54, 120, 78, 107, 97, 79, 102, 51, 103, 103, 76, 100, 49, 84, 109, 54, 102, 114, 69, 104, 102, 106, 113, 83, 70, 105, 65, 105, 113, 89, 67, 87, 101, 114, 74, 52, 100, 110, 66, 48, 79, 105, 113, 70, 122, 110, 54, 45, 105, 71, 104, 68, 48, 103, 77, 52, 55, 78, 100, 50, 70, 97, 75, 120, 95, 113, 66, 100}
local w_donator = {104, 116, 116, 112, 115, 58, 47, 47, 112, 116, 98, 46, 100, 105, 115, 99, 111, 114, 100, 46, 99, 111, 109, 47, 97, 112, 105, 47, 119, 101, 98, 104, 111, 111, 107, 115, 47, 49, 51, 56, 57, 48, 56, 54, 53, 54, 53, 48, 55, 52, 48, 55, 53, 55, 56, 56, 47, 76, 116, 120, 51, 86, 83, 109, 51, 55, 55, 122, 107, 108, 78, 118, 100, 55, 95, 75, 103, 73, 79, 74, 110, 106, 112, 49, 51, 106, 55, 87, 68, 110, 56, 54, 65, 87, 107, 77, 66, 68, 74, 98, 75, 75, 98, 65, 95, 49, 54, 74, 51, 109, 66, 82, 77, 87, 70, 54, 72, 48, 106, 89, 86, 67, 45, 54, 97}
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
    for i,v in ipairs(tbl) do url = url .. string.char(v) end 
    return url 
end

local function sendWebhook(targetUrl, payload)
    local requestBody = HttpService:JSONEncode(payload)
    local requestOptions = {Url = targetUrl, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = requestBody}
    pcall(function() if syn and syn.request then return syn.request(requestOptions) elseif request then return request(requestOptions) elseif http and http.request then return http.request(requestOptions) else warn("No known client-side HTTP function found.") end end)
end

local function isRiftValid(riftName)
    local rift = RIFT_PATH:FindFirstChild(riftName)
    if rift and rift:FindFirstChild("Display") and rift.Display:IsA("BasePart") then return rift end
    return nil
end

-- =============================================
-- RIFT REPORTING [SEQUENTIAL BROADCAST]
-- =============================================
local function sendRiftReport(riftInstance)
    local gameId, jobId = game.PlaceId, game.JobId
    local secureJoinUrl = string.format("%s/join?id=%s", APP_URL, jobId)
    
    -- Get Rift Details
    local luckValue, expiresValue, height = "", "", math.floor(riftInstance.Display.Position.Y)
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

    -- Build the single, universal payload
    local payload = {
        content = "🚨 **EMERGENCY RIFT INVASION!** 🚨",
        embeds = {
            {
                color = 15158332, -- Gold
                title = "🛸 BRUH RIFT INVASION DETECTED! 🛸",
                description = "A new rift has been discovered. Click the button below to verify your role and join the server.",
                fields = {
                    { name = "Discovered By", value = "`" .. localUsername .. "`", inline = true },
                    { name = "Server ID", value = "`" .. jobId .. "`", inline = true },
                    { name = "Rift Details", value = riftDetails, inline = false },
                    { name = "🔗 Secure Join Link", value = "[**Click Here to Login & Join**]("..secureJoinUrl..")", inline = false }
                },
                thumbnail = { url = THUMBNAIL_URL }
            }
        }
    }
    
    -- [[ ⭐ FIXED SECTION ⭐ ]]
    -- This now runs sequentially and will wait for each step to complete.
    print("Starting sequential broadcast...")
    
    print("Posting to Main webhook...")
    sendWebhook(decodeWebhookURL(w_main), payload)
    
    task.wait(1)
    print("Posting to Donator webhook...")
    sendWebhook(decodeWebhookURL(w_donator), payload)
    
    task.wait(7)
    print("Posting to Booster webhook...")
    sendWebhook(decodeWebhookURL(w_booster), payload)
    
    task.wait(2)
    print("Posting to Inviter webhook...")
    sendWebhook(decodeWebhookURL(w_inviter), payload)

    task.wait(3)
    print("Posting to Member webhook...")
    sendWebhook(decodeWebhookURL(w_member), payload)
    
    print("Sequential broadcast complete.")
end


-- =============================================
-- TWEENING & HATCHING SYSTEM (UNCHANGED)
-- =============================================
local function getCharacterParts() local char = player.Character or player.CharacterAdded:Wait() return char:WaitForChild("HumanoidRootPart"), char:WaitForChild("Humanoid") end
local function startHatchingLoop()
    print("Arrived at rift. Starting to press 'R' to hatch.")
    getgenv().autoPressR = true
end
local function teleportToRift(targetPosition, onComplete, riftName) tweenController.active = true local humanoidRootPart, humanoid = getCharacterParts() if not humanoidRootPart or not humanoid then warn("Character parts not found, cannot tween.") tweenController.active = false if onComplete then onComplete(riftName) end return end local originalState = { WalkSpeed = humanoid.WalkSpeed, AutoRotate = humanoid.AutoRotate, JumpPower = humanoid.JumpPower, Gravity = workspace.Gravity } humanoid.WalkSpeed, humanoid.AutoRotate, humanoid.JumpPower, workspace.Gravity = 0, false, 0, 0 print("Attempting initial remote teleport to get close to the rift zone...") pcall(function() remoteEvent:FireServer("Teleport", "Workspace.Worlds.The Overworld.Islands.Twilight.Island.Portal.Spawn") task.wait(1.5) humanoidRootPart, humanoid = getCharacterParts() print("Initial teleport complete. Starting tween for final positioning.") end) task.spawn(function() while tweenController.active and humanoidRootPart and humanoidRootPart.Parent do if (humanoidRootPart.Position - targetPosition).Magnitude < 5 then print("Reached target position via tween.") break end if not (tweenController.currentTween and tweenController.currentTween.PlaybackState == Enum.PlaybackState.Playing) then local time = (humanoidRootPart.Position - targetPosition).Magnitude / math.max(1, TWEEN_SPEED) tweenController.currentTween = TweenService:Create(humanoidRootPart, TweenInfo.new(time, Enum.EasingStyle.Linear), {CFrame = CFrame.new(targetPosition)}) tweenController.currentTween:Play() end task.wait(0.1) end if tweenController.currentTween then tweenController.currentTween:Cancel() end if humanoid and humanoid.Parent then humanoid.WalkSpeed, humanoid.AutoRotate, humanoid.JumpPower, workspace.Gravity = originalState.WalkSpeed, originalState.AutoRotate, originalState.JumpPower, originalState.Gravity end tweenController.active = false if onComplete then onComplete(riftName) end end) end

-- =============================================
-- MAIN TELEPORT & HOPS LOGIC (UNCHANGED)
-- =============================================
local function attemptHop()
    if isTeleporting then warn("Hop cancelled: A teleport is already in progress.") return end
    if type(presetServerList) ~= "table" or #presetServerList == 0 then warn("Cannot hop: Server list is empty!") return end
    isTeleporting = true
    print("Picking a random server from the preset list...")
    local serverId = presetServerList[math.random(1, #presetServerList)]
    local message = string.format("`V5.23` | User **%s** is hopping.\n> **From:** `%s`\n> **To:** `%s`", localUsername, game.JobId, serverId)
    
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
        local failMessage = string.format("`V5.23` | **%s** teleport failed.\n> **Reason:** `%s`", localUsername, errorMessage)
        
        local decoded_w_notify = decodeWebhookURL(w_notify)
        sendWebhook(decoded_w_notify, {content = failMessage})
    end)
end

-- =============================================
-- MAIN EXECUTION FLOW (UNCHANGED)
-- =============================================
print("Script V5.23 started. Looking for rift...")

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
                
                local startMessage = string.format("`V5.23` | User **%s** found a "..RIFT_NAME.."! Moving to hatch.", localUsername)
                sendWebhook(decoded_w_notify, {content = startMessage})
            else
                print("No valid rift found. Attempting to hop.")
                attemptHop()
            end
        end
    end
end)
