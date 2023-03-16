# Automatically create products in Shopify using Google Sheets and OpenAI APIs

This is inspired by [this video](https://www.youtube.com/shorts/IPu4OAIA69g) that shows a cool integration between Google Sheets, OpenAI and Shopify.

The video goes on to show,
1. Read new product information from a row of a Google Sheet
2. Call OpenAI text generation API to generate a description for the product based on the title
3. Call OpenAI image generation API to generate a product image
4. Call Shopify API to create a new product

This is a Ballerina program that does the same.

Product information on the Google Sheet

![image](https://user-images.githubusercontent.com/57770159/221789977-eca82ba3-491d-4ca5-9401-938c8affd68b.png)

Product created in Shopify store

![image](https://user-images.githubusercontent.com/57770159/221789693-8afb5be2-ffe7-4d53-9b09-069372c4fb00.png)

Autogenerated visualization of the Ballerina source code (using Ballerina plugin in VSCode)

![image](https://user-images.githubusercontent.com/57770159/221790611-91d6e9d8-97be-4185-befe-eb638a271ef2.png)

This is written as an HTTP service. Also possible to write this as a webhook listener that listens to a new row addition in Google Sheets and creates products in Shopify.