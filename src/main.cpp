#include <Geode/Geode.hpp>
#include <Geode/modify/MenuLayer.hpp>

using namespace geode::prelude;

class $modify(HelloMenuLayer, MenuLayer) {
    bool init() {
        if (!MenuLayer::init()) {
            return false;
        }

        // Показуємо плашку одразу при вході в головне меню
        FLAlertLayer::create(
            "Hello",          // заголовок
            "Hello World!",   // текст
            "OK"               // текст кнопки
        )->show();

        return true;
    }
};
