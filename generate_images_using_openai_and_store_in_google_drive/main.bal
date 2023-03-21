import ballerina/lang.array;
import ballerinax/googleapis.drive;
import ballerinax/googleapis.sheets;
import ballerinax/openai.images;

configurable string googleAccessToken = ?;
configurable string openAIToken = ?;
configurable string sheetId = ?;
configurable string sheetName = ?;
configurable string gDriveFolderId = ?;

public function main() returns error? {
    sheets:Client gSheets = check new ({auth: {token: googleAccessToken}});
    images:Client openAIImages = check new ({auth: {token: openAIToken}});
    drive:Client gDrive = check new ({auth: {token: googleAccessToken}});

    sheets:Column range = check gSheets->getColumn(sheetId, sheetName, "A");
    foreach var cell in range.values {
	    if cell is string {
            images:CreateImageRequest imagePrompt = {
                prompt: cell,
                response_format: "b64_json"
            };
            images:ImagesResponse imageRes = check openAIImages->/images/generations.post(imagePrompt);
            string? encodedImage = imageRes.data[0].b64_json;
	        if encodedImage is string {
            	// Decode the Base64 string and store image in Google Drive
            	byte[] imageBytes = check array:fromBase64(encodedImage);
            	_ = check gDrive->uploadFileUsingByteArray(imageBytes, string `${cell}.png`, gDriveFolderId);
	        }
        }
    }
}
