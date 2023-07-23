function onEvent(name,value1,value2)
    if name == "smooth zoom" then   
        doTweenZoom('camerazoom','camGame',value1,value2,'quadInOut')
    end
end