import QtQuick 2.15

Rectangle {
    id: navSearchBox
    radius: 5
    color: "#ffffff"


    Image {
        id: searchIcon
        source: "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAAACXBIWXMAAA7DAAAOwwHHb6hkAAAAGXRFWHRTb2Z0d2FyZQB3d3cuaW5rc2NhcGUub3Jnm+48GgAABkBJREFUeJztmltsVFUUhv+1p1PaSglG7g2kCS8aBES0gXCJUbxExReoguGhIXHSkJ7L0L74ohMvCArM5bQEakIwRl9Kn0ChYCAGIqVqlIBiROKNQoSCtGDswMxePrQ1dmZPe87ZMzXofMm8rLXPWmv+mbPX3vscoEiRIkWKFClS5H8KjUUS27arScp7AcySzHcDgBAiJYErzPxDeX//N1taW3vHopZMCiJAJBIpud7T8ziI1oBoBYAZo1ySBvMpEmI/pVIfbG9p+b4QdanIqwCRurqy6xMmvASgCcAs34GYOwh4M+o4x/JWXA7yJoBpmk8LIAFgdr5iEtCGQCAcjUa78xVTkUMPwzDGlQjxNjMb+Yin4CoT1cXj8f0FiI2AzsW2bU8UwAEAz8Pdl2cAlwc/QQClLq6pIGDt4kWL+jpPnuz0X60a37+YbdsTIeVRAA/kGsNAvwA+AbBPpNMdlZMnd0cikdSQPxQKVZSXl88l5pUgeg7Mc0dJ+0oskXjdb80qfAkwONkdArAsx5AUgN0UCLzm5f4NG8YTINrEwMJcY5i5Pu44uzyWnBNfAlim2ULAhhwBv2UhVsdisbN+a7IMI0RECahvkVvEvCzqOF0+4w9P5vWCwdn+I5WPgY8l81rHcfp0C7MsaykB7WCeonCfp0BgbjQa/VM3j/AyOFJXVzbY6lTsvXjp0nP5+PIAEI/Hj4PoERCpVoizOZ1+OR95PAnwe2VlCIo+T8CXaeZ1bW1t6XwUNUQsFjuLdHotAFXcRsMwJuvmcC1AJBIpIaKwwpUSUq5zHCepW4yKWHPzAQbeUbgqSoQwdeO7FqD32rUVAKoVrt3bmpu/0y1kJMr6+zcDuJppZ+b1tbW1WmsZ1wIwsEZh608z57Uvq9jS2trLzFsUrhlVVVW5WrEr3M8BzI9mmgg47DjOBZ0C3BK8ffs9ADLLIWVWXV5wJYBt29UgmplpZ2ZlOywEW3fuvAzg86wagKU6cV0JMHiYkUWa+ZBOcq8Q0eEsG6CszS1ub4FqhU1OmjTpV53kXmHmnxXmaYZhjPMb05UADExQmK/8c2MzFkjgosJMpaWllX5juv0HBBW2m36T+iXAfENlTyaTbrbVStwKoFpzq9boBUUKMU1lJ6KsNYJb3ApwRWGrbGpqustvYj8Qs0qAPp1VqCsBJHBeZU+lUvP8JvYF0ZxME6vnBde4mwSZz0C1IZHyGZ3kHiEwP5ttxGc6QV0J4DhOHwFfK1wrdZJ7IdzQsBBAVaadiT7VietlL7BPYZ5nWdaTOgW4zh8IbFSYpZTyiE5c1wJI4EMMnOoOg4A3UOBHbBsNYwGYX8i0M3BQdy/iWoBEInEORAezHMwPWYYR0iliJEKhUFAOnA9m1zpg18LTiRBJ+ZbSTpSwGxqW6BajorysLAbVhofodDwe196LeBIg6jjHCGhTuEohRHtjQ4PWxiSTsGWFc5w+S8lcD8Ut6RVPAgAAAoEwFKczAKamhTgRNs2ndIsKhUJByzRbmHm7yk/MOxKJhFb7G8KzANFotJuJ1kOt/kQG9tumuckwDNUGalQ2GsaCirKyI7meOwCAFOK4n9gqfM/eYctqZOatIwzpIaLNgWTy/cHDjBHrME3zQUHUODjbj/bDJMG8KuY42gcyWu3LNs0IgFdHGSYZ6BJEh8D8Uxr4TUjZC6KpIKoC0ZzBFV7WImcU8iKCdv8OW9YGZo5BvWUuNNoieJ8EM4jG4zsE83ICftSNpUACaAHziwBuKfzjQNRuG4bvPYnWmfoQJ7q6LsybP//d0mCQATyMfPwbiE5DytUxx9nV2dV1ZnFNzSkQrUJ2zSUgWrWopuarzq6uc57TaBeaQVN9/ZTbwaBFRHUY/eWoTJiBDgHEo4lEBzI6TdgwVjLRXqifGvu6HQq2hq+trQ3MnD59uQQeA/MSEN0HYGrGsJsAugF0EnBUEh2Nx+O/jBQ33yKMyXuCQ4RCoYoJQoxPBoOl99y40RPZs6ffT5x8ijCmAuSTUUS4GUin79/W0qI6Rh+Gdhf4t4g6zj5iXg11dxifKilxdVhzxwoAjCyCAK65iXFHCwAME+GPv41EX6SkbHdz/R07B2Ri23Y1Dyypr0sp2wr1wkaRIkWKFClSpMh/hr8AOEQ/EAKvW8oAAAAASUVORK5CYII="
        anchors {
            left: parent.left
            leftMargin: 20
            verticalCenter: parent.verticalCenter
        }
        height: parent.height * .45
        fillMode: Image.PreserveAspectFit
    }

    Text {
        id: navigationPlaceHolderText
        visible: navigationTextInput.text === ""
        color: "#706E6E"
        text: "Navigate"
        anchors {
             verticalCenter: parent.verticalCenter
             left: searchIcon.right
             right: parent.right
             leftMargin: 20
        }
    }

    TextInput {
        id: navigationTextInput
        anchors {
             left: searchIcon.right
             right: parent.right
             top: parent.top
             bottom: parent.bottom
             leftMargin: 20
             rightMargin: 20
        }
        clip: true
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 16

    }
}
