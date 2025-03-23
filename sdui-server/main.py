from fastapi import FastAPI
from fastapi.responses import JSONResponse

app = FastAPI()

@app.get("/sdui/home")
def get_components():
    response = {
  "components": [
    {
      "type": "greeting_header",
      "id": "header1",
      "properties": {
        "componentId": "header1",
        "title": "Olá, Jean!",
        "subtitle": "Seja bem-vindo de volta",
        "avatarUrl": "https://example.com/avatar.png"
      }
    },
        {
      "type": "balance_card",
      "id": "balance1",
      "properties": {
        "componentId": "balance1",
        "balance": 3250.75,
        "currency": "BRL"
      }
    },
    {
      "type": "section_title",
      "id": "title1",
      "properties": {
        "componentId": "title1",
        "title": "Seus cartões"
      }
    },
    {
      "type": "banner_carousel",
      "id": "carousel1",
      "properties": {
        "componentId": "carousel1",
        "banners": [
          {
            "imageUrl": "https://www.alelo.com.br/content/dam/alelo-institucional/Cards-de-Produtos/Card_Alimentacao.png",
            "action": {
              "actionType": "deeplink",
              "parameters": {
                "url": "https://example.com/promo1"
              }
            }
          },
          {
            "imageUrl": "https://www.alelo.com.br/content/dam/alelo-institucional/Cards-de-Produtos/Card_Refeicao.png",
            "action": {
              "actionType": "deeplink",
              "parameters": {
                "url": "https://example.com/promo2"
              }
            }
          }
        ]
      }
    },
    {
      "type": "spacer",
      "id": "spacer1",
      "properties": {
        "componentId": "spacer1",
        "height": 24
      }
    },
    {
      "type": "category_carousel",
      "id": "categories1",
      "properties": {
        "componentId": "categories1",
        "categories": [
          {
            "name": "Alimentação",
            "icon": "https://example.com/icons/food.png",
            "action": {
              "actionType": "navigation",
              "parameters": {
                "destination": "categoryDetail",
                "category": "food"
              }
            }
          },
          {
            "name": "Transporte",
            "icon": "https://example.com/icons/transport.png",
            "action": {
              "actionType": "navigation",
              "parameters": {
                "destination": "categoryDetail",
                "category": "transport"
              }
            }
          }
        ]
      }
    },
    {
      "type": "section_title",
      "id": "title2",
      "properties": {
        "componentId": "title2",
        "title": "Destaques"
      }
    },
    {
      "type": "single_banner",
      "id": "banner3",
      "properties": {
        "componentId": "banner3",
        "imageUrl": "https://blog.alelo.com.br/wp-content/uploads/2022/09/Banner-pagina-produto-tudo-DESK.png",
        "action": {
          "actionType": "deeplink",
          "parameters": {
            "url": "https://example.com/highlight"
          }
        }
      }
    },
    {
      "type": "spacer",
      "id": "spacer1",
      "properties": {
        "componentId": "spacer1",
        "height": 24
      }
    }
  ]
}


    return JSONResponse(content=response)
