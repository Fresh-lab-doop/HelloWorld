#include <Geode/Geode.hpp>

using namespace geode::prelude;

$on_game(Loaded) {
    auto alert = FLAlertLayer::create(
        "Hello",
        "Hello World!",
        "OK"
    );
    alert->show();
}
