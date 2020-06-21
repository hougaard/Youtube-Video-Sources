HTMLContainer = document.getElementById("controlAddIn");

HTMLContainer.insertAdjacentHTML('beforeend',
    '<canvas id="renderCanvas" style="width: 100%; height: 100%;"></canvas>');

    var canvas = document.getElementById("renderCanvas");

    var engine = null;
    var scene = null;
    var sceneToRender = null;
    var createDefaultEngine = function() { return new BABYLON.Engine(canvas, true, { preserveDrawingBuffer: true, stencil: true }); };
    var createScene2 = function () {
    
        // This creates a basic Babylon Scene object (non-mesh)
        var scene = new BABYLON.Scene(engine);
    
        // This creates and positions a free camera (non-mesh)
        var camera = new BABYLON.FreeCamera("camera1", new BABYLON.Vector3(0, 5, -10), scene);
    
        // This targets the camera to scene origin
        camera.setTarget(BABYLON.Vector3.Zero());
    
        // This attaches the camera to the canvas
        camera.attachControl(canvas, true);
    
        // This creates a light, aiming 0,1,0 - to the sky (non-mesh)
        var light = new BABYLON.HemisphericLight("light", new BABYLON.Vector3(0, 1, 0), scene);
    
        // Default intensity is 1. Let's dim the light a small amount
        light.intensity = 0.7;
    
        // Our built-in 'sphere' shape.
        var sphere = BABYLON.MeshBuilder.CreateSphere("sphere", {diameter: 1, segments: 32}, scene);
    
        // Move the sphere upward 1/2 its height
        sphere.position.y = 1;
    
        // Our built-in 'ground' shape.
        var ground = BABYLON.MeshBuilder.CreateGround("ground", {width: 6, height: 6}, scene);
    
        return scene;
    
    };

    var createScene = function () {
        var scene = new BABYLON.Scene(engine);
        var camera = new BABYLON.ArcRotateCamera("Camera", 0, 0, 10, new BABYLON.Vector3(0, 0, 0), scene);
        camera.setPosition(new BABYLON.Vector3(0, 0, 10));
        camera.lowerRadiusLimit = 3.5
        camera.upperRadiusLimit = 20
        camera.wheelPrecision  = 50
        camera.setTarget(BABYLON.Vector3.Zero());
        camera.attachControl(canvas, true);
        var light = new BABYLON.HemisphericLight("light", new BABYLON.Vector3(0.5, -5, -0.5), scene);
        scene.ambientColor = new BABYLON.Color3(0.62, 0.51, 0.68)    
        let fx = createVisualChain(scene)
        createSky(scene)
        createPlanet(scene)
        createJunkCloud(scene) 
        createOrbital(scene)
        
        let fxLevel = 0.
        let fxTarget =  0.48
    
        let d = ()=>{
            return 1.0-((camera.position.length())-camera.lowerRadiusLimit)/(camera.upperRadiusLimit-camera.lowerRadiusLimit)
        }
        scene.onReadyObservable.addOnce(()=>{
           scene.onBeforeRenderObservable.add(()=>{        
            //camera.setPosition(new BABYLON.Vector3(Math.cos(Date.now()*0.00002)*10., 0, Math.sin(Date.now()*0.00002)*10.));
                if(fxLevel<fxTarget - (d()*0.2)){
                    fx.downsample._options = fxLevel
                    fxLevel += 0.001
                }else{
                    let _d = d()
                    fx.downsample._options = fxTarget - (d()*0.3)      
                }
            })
        })
        scene.getEngine().enterFullscreen()      
        return scene;
    }
    
    let sceneSize = 1000
    
    let createOrbital = (scene)=>{
        let orbitSphere = BABYLON.MeshBuilder.CreateSphere('orbitSphere', {diameter:1, segments:3}, scene)
        let orbitMat = new BABYLON.StandardMaterial("orbit-mat", scene)
        orbitMat.emissiveColor = new BABYLON.Color3.FromHexString('#303000')
        orbitMat.ambiantColor = new BABYLON.Color3.FromHexString('#A60EAD')
        orbitMat.specularColor = BABYLON.Color3.Black()    
    
        let orbit = new BABYLON.SolidParticleSystem("orbit", scene);
    
        orbit.addShape(orbitSphere, 600) 
    
        var orbitMesh = orbit.buildMesh()
        //orbitMesh.hasVertexAlpha = true
        
        orbitMesh.material = orbitMat
        orbit.isAlwaysVisible = true
        orbitSphere.dispose()
    
        let time = 0
        let delta = 0
        let lastSpawn = Date.now()
        let spawnRate = 0
        let colorSteps = [0.0, 0.05, 0.5, 0.8]
    
        let spawnPosition = BABYLON.Vector3.Right().scale(2.55)
        let m = new BABYLON.Matrix()
    
        orbit.resetParicle = (particle)=>{  
                particle.position = BABYLON.Vector3.Zero()
                particle.scale = BABYLON.Vector3.Zero()
                particle.rotation.x = 0
                particle.rotation.y = 0
                particle.rotation.z = 0
                particle.lifeSpan = 1000
                particle.time = 0
                particle.colorStart = new BABYLON.Color4(0.99, 0.98, 0.85, 0.0)
                particle.colorA = new BABYLON.Color4(1, 1, 0.47, 1.0)
                particle.colorB = new BABYLON.Color4(1, 0.53, 0, 0.9)
                particle.colorC = new BABYLON.Color4(0.84, 0.32, 0.8)
                particle.colorD = new BABYLON.Color4(0.04, 0.07, 0.7)
                particle.spawned = false
    
                /*let dir = BABYLON.Vector3.Zero()
                let a = Math.cos(time)*Math.PI*2;            
                let rq = BABYLON.Quaternion.RotationAxis(BABYLON.Axis.Y, a)
                let m = new BABYLON.Matrix()
                rq.toRotationMatrix(m)
                particle.position = BABYLON.Vector3.TransformCoordinates(BABYLON.Vector3.Right().scale(2.55), m)
                particle.scale = new BABYLON.Vector3(0.05, 0.05, 0.05)
                particle.rotation.x = Math.random() * Math.PI*2;
                particle.rotation.y = Math.random() * Math.PI*2;
                particle.rotation.z = Math.random() * Math.PI*2;
                */	      
        };
    
        orbit.initParticles = ()=>{
            for (var p = 0; p < orbit.nbParticles; p++) {
                orbit.resetParicle(orbit.particles[p]); 
            }
        }
    
        orbit.updateParticle = (p)=>{
            if(!p.spawned){return}        
            p.time+=delta
            if(p.time>=p.lifeSpan){
                orbit.resetParicle(p)
            }
            let d = p.time/p.lifeSpan
            let sd = 1.0-Math.abs(d-0.1)
            p.scale = new BABYLON.Vector3(sd,sd,sd).multiplyByFloats(0.15, 0.15, 0.7+(d*0.3))        
            // p.color =  BABYLON.Color3.Lerp(p.colorA.clone(), p.colorB.clone(), d)    
            if(d<colorSteps[0]){
                p.color = p.colorStart.clone()
            }else if(d>colorSteps[0] && d<colorSteps[1]){
                sd = (d-colorSteps[0])/(colorSteps[1]-colorSteps[0])
                p.color = BABYLON.Color3.Lerp(p.colorStart.clone(), p.colorA.clone(), sd)
            }else if(d>colorSteps[1] && d<colorSteps[2]){
                sd = (d-colorSteps[1])/(colorSteps[2]-colorSteps[1])
                p.color = BABYLON.Color3.Lerp(p.colorA.clone(), p.colorB.clone(), sd)
            }else if(d>colorSteps[2] && d<colorSteps[3]){
                sd = (d-colorSteps[2])/(colorSteps[3]-colorSteps[2])
                p.color = BABYLON.Color3.Lerp(p.colorB.clone(), p.colorC.clone(), sd)
            }else{
                sd = (d-colorSteps[3])/(1.0-colorSteps[3])
                p.color = BABYLON.Color3.Lerp(p.colorC.clone(), p.colorD.clone(), sd)
            }
        }
    
        //https://github.com/scijs/periodic-function
        function triangle(t, ratio) {
            t%=1
            if (t < 0) t += 1
    
            if (ratio == 0.5 || ratio == null) {
                if (t > 0.5) t = 1 - t;
                return 1 - 4 * t;
            }
    
            if (ratio == 1) {
                return 1 - 2*t
            }
    
            if (ratio == 0) {
                return -1 + 2*t
            }
    
            if (t < ratio) {
                return 1 - 2*t/ratio
            }
            else {
                return -1 + 2*(t-ratio)/(1-ratio)
            }
        }
    
        orbit.spawn = (id)=>{
            let p = orbit.particles[id]
            let a = (triangle(time*0.5, 0)*Math.PI)
            let rq = BABYLON.Quaternion.RotationAxis(BABYLON.Axis.Y, a)
            rq.toRotationMatrix(m)
            p.position = BABYLON.Vector3.TransformCoordinates(spawnPosition, m)
            p.scale = new BABYLON.Vector3(0.1, 0.1, 0.5)
            p.rotation.y = a
            p.spawned = true
       
            //console.log(p, "SPAWNED")      
            
        }
     
        orbit.initParticles()
        orbit.setParticles()
    
        orbit.currentID = 0
        orbit.getCurrentSpawn = (increment = true)=>{        
            if(increment){
                 orbit.currentID++
            } 
            if(orbit.currentID >= orbit.nbParticles){
                orbit.currentID = 0          
            }
            return orbit.currentID
        } 
        
        orbitMesh.rotation.z = Math.PI*0.25
        orbitMesh.rotation.x = Math.PI*0.09
        scene.onBeforeRenderObservable.add(()=>{
            let n = Date.now()
            delta = scene.getEngine().getDeltaTime()
            time += delta *0.001
            if(n - lastSpawn > spawnRate){
                lastSpawn = n
                orbit.spawn(orbit.getCurrentSpawn())
            }
            orbit.setParticles()
        })
    
    }
    
    let createJunkCloud = (scene)=>{
           
        let junkMatA = new BABYLON.StandardMaterial('junkMatA', scene)    
        junkMatA.diffuseColor = new BABYLON.Color3(0.16, 0.36, 0.57)
        junkMatA.diffuseFresnelParameters = new BABYLON.FresnelParameters();
        junkMatA.diffuseFresnelParameters.bias = 0.8;
        junkMatA.diffuseFresnelParameters.power = 12;
        junkMatA.diffuseFresnelParameters.leftColor = new BABYLON.Color3(0.28, 0.63, 0.96)
        junkMatA.diffuseFresnelParameters.rightColor = new BABYLON.Color3(0, 0.1, 0.19)
        junkMatA.emissiveColor = new BABYLON.Color3(0.03, 0.03, 0.03)
        junkMatA.emissiveFresnelParameters = new BABYLON.FresnelParameters();
        junkMatA.emissiveFresnelParameters.bias = 0.8;
        junkMatA.emissiveFresnelParameters.power = 12;
        junkMatA.emissiveFresnelParameters.leftColor = new BABYLON.Color3(0.25, 0.48, 0.69)
        junkMatA.emissiveFresnelParameters.rightColor = new BABYLON.Color3(0, 0.1, 0.19)
        junkMatA.ambientColor = BABYLON.Color3.FromHexString('#0E0031')
    
    
        let junkMatB = new BABYLON.StandardMaterial('junkMatB', scene)    
        junkMatB.diffuseColor = new BABYLON.Color3(0.0, 0.0, 0.0)
        junkMatB.diffuseFresnelParameters = new BABYLON.FresnelParameters();
        junkMatB.diffuseFresnelParameters.bias = 0.8;
        junkMatB.diffuseFresnelParameters.power = 12;
        junkMatB.diffuseFresnelParameters.leftColor = new BABYLON.Color3(0.88, 0.98, 0.98)
        junkMatB.diffuseFresnelParameters.rightColor = new BABYLON.Color3(0.51, 0.51, 0.51)
        junkMatB.emissiveColor = new BABYLON.Color3.FromHexString('#5ED5EB')
        junkMatB.emissiveFresnelParameters = new BABYLON.FresnelParameters();
        junkMatB.emissiveFresnelParameters.bias = 0.8;
        junkMatB.emissiveFresnelParameters.power = 12;
        junkMatB.emissiveFresnelParameters.leftColor = new BABYLON.Color3(0.48, 0.49, 0.5)
        junkMatB.emissiveFresnelParameters.rightColor = new BABYLON.Color3(0.1, 0.15, 0.19)
        junkMatB.ambientColor = BABYLON.Color3.FromHexString('#C5E9E9')
    
        let junk = new BABYLON.SolidParticleSystem("junk", scene, {
            useModelMaterial: true
        }); 
    
        let tbTo = 64
        let typeBcount = 0
        junk.resetParicle = (p)=>{ 
            if(p.type==0){       
                let dir = BABYLON.Vector3.Zero()
                dir.z = Math.cos((Math.random()*Date.now())*Math.PI)*2.5
                dir.x = Math.sin((Math.random()*Date.now())*Math.PI)*2.5
                dir.y = Math.cos(Math.random()*Date.now())*0.25
                dir = dir.normalize().scale(1.35+(Math.random()*0.8))
    
                p.position = dir;
                p.rotation.x = Math.random() * Math.PI*2;
                p.rotation.y = Math.random() * Math.PI*2;
                p.rotation.z = Math.random() * Math.PI*2;
    
                p.color.r += Math.sin(Math.random())*0.04
                p.color.b += Math.cos(Math.random())*0.05
                p.color.g =  1.2-((p.color.r + p.color.b)*0.25)
                p.color.b -= 1.0-p.color.r           
                
                let sr = Math.cos(Date.now()*424.5433)
                let sr2 = Math.cos(Date.now()*1.2321)
                let sr3 = Math.cos(Date.now()*333322.123)
    
                let rT = Math.random()
    
                if(rT < 0.4){
                    sr = (sr*0.02)+0.15
                    sr2 = (sr2*0.02)+0.15
                    sr3 = (sr3*0.02)+0.15
                }else{
                    sr = (sr*0.08)+0.02
                    sr2 = (sr2*0.08)+0.02
                    sr3 = (sr3*0.08)+0.02
                }
                p.scale = BABYLON.Vector3.FromArray([sr,sr2,sr3])
            }else{
                let step = (Math.PI*2)/tbTo
                let a = step*typeBcount
                let odd = typeBcount%2
                let b = Math.sin(a*3.0)*((odd)*2.0-1.0)
                let hp = new BABYLON.Vector3.Up().scale(b*0.2)
                if(!odd){
                    a+=step*(tbTo*0.25)
                }
    
                let rq = BABYLON.Quaternion.RotationAxis(BABYLON.Axis.Y, a)
                let m = new BABYLON.Matrix()
    
                let dir = hp.add(BABYLON.Vector3.Right()).normalize()
                
                rq.toRotationMatrix(m)
                p.position = BABYLON.Vector3.TransformCoordinates(dir.scale(1.85), m)            
    
                p.scale = new BABYLON.Vector3(0.04, 0.04, 0.04)
    
                p.rotation.x = Math.random() * Math.PI*2;
                p.rotation.y = Math.random() * Math.PI*2;
                p.rotation.z = Math.random() * Math.PI*2;
                typeBcount++;
            }	      
        };
    
     
        junk.initParticlesA = ()=>{
            for (let i = 0; i < junk.nbParticles-tbTo; i++) {
                let p = junk.particles[i]
                p.type = 0
                
                junk.resetParicle(p); 
            }
        } 
        junk.initParticlesB = ()=>{
            for (let i = 0; i < tbTo; i++) {
                let p = junk.particles[(junk.nbParticles-tbTo)+i]
                p.type = 1
                //console.log(p)
                junk.resetParicle(p); 
            }
        }     
    
        junk.updateParticle = (particle)=>{
            return false
        }
    
        let junkBox = BABYLON.MeshBuilder.CreateBox('junkBox', {size:1}, scene)
        junkBox.material = junkMatA
        junk.addShape(junkBox, 264, { positionFunction: junk.initParticlesA })
        
        let junkBoxB = BABYLON.MeshBuilder.CreateBox('junkBox', {size:1}, scene)
        junkBoxB.material = junkMatB
        junk.addShape(junkBoxB, tbTo, { positionFunction: junk.initParticlesB })    
        
        var junkMesh = junk.buildMesh() 
        junk.isAlwaysVisible = true
        junkBox.dispose()
        junkBoxB.dispose()
    
        junk.initParticles()
        junk.setParticles()
        junkMesh.rotation.x = Math.PI*0.03;
        junkMesh.rotation.z = Math.PI*0.045;
        let up  = junkMesh.up.clone()
        scene.onBeforeRenderObservable.add(()=>{
            junkMesh.rotate(up, Math.PI*0.001, BABYLON.Space.WORLD)
        })
    
    
    }
    
    let createPlanet = (scene)=>{
        let water = BABYLON.MeshBuilder.CreateSphere("sphere", {diameter: 2, segments: 32}, scene)
    BABYLON.Effect.ShadersStore["retroWaterVertexShader"] =
    `
    attribute vec3 position;
    attribute vec3 normal;
    attribute vec2 uv;
    uniform mat4 worldViewProjection;
    varying vec3 vPosition;
    varying vec3 nPosition;
    varying vec2 vUV;
    
    void main() {
        vec4 p = vec4( position, 1. );
        vPosition = p.xyz;
        nPosition = normalize(position.xyz);
        vUV = uv;
        gl_Position = worldViewProjection * p;
    }`;
    
    BABYLON.Effect.ShadersStore["retroWaterFragmentShader"] = 
    `
    #define PI        3.14159265
    #define HALFPI    1.57079633
    #define ROOTTHREE 1.73205081
    
    uniform float time;
    uniform vec3 sunDirection;
    varying vec3 vPosition;
    varying vec3 nPosition;
    varying vec2 vUV;
    
    //	<https://www.shadertoy.com/view/4dS3Wd>
    //	By Morgan McGuire @morgan3d, http://graphicscodex.com
    //
    float hash(float n) { return fract(sin(n) * 1e4); }
    float hash(vec2 p) { return fract(1e4 * sin(17.0 * p.x + p.y * 0.1) * (0.1 + abs(sin(p.y * 13.0 + p.x)))); }
    
    float noise(float x) {
        float i = floor(x);
        float f = fract(x);
        float u = f * f * (3.0 - 2.0 * f);
        return mix(hash(i), hash(i + 1.0), u);
    }
    
    float noise(vec2 x) {
        vec2 i = floor(x);
        vec2 f = fract(x);
    
        // Four corners in 2D of a tile
        float a = hash(i);
        float b = hash(i + vec2(1.0, 0.0));
        float c = hash(i + vec2(0.0, 1.0));
        float d = hash(i + vec2(1.0, 1.0));
    
        // Simple 2D lerp using smoothstep envelope between the values.
        // return vec3(mix(mix(a, b, smoothstep(0.0, 1.0, f.x)),
        //			mix(c, d, smoothstep(0.0, 1.0, f.x)),
        //			smoothstep(0.0, 1.0, f.y)));
    
        // Same code, with the clamps in smoothstep and common subexpressions
        // optimized away.
        vec2 u = f * f * (3.0 - 2.0 * f);
        return mix(a, b, u.x) + (c - a) * u.y * (1.0 - u.x) + (d - b) * u.x * u.y;
    }
    
    // This one has non-ideal tiling properties that I'm still tuning
    float noise(vec3 x) {
        const vec3 step = vec3(110, 241, 171);
    
        vec3 i = floor(x);
        vec3 f = fract(x);
     
        // For performance, compute the base input to a 1D hash from the integer part of the argument and the 
        // incremental change to the 1D based on the 3D -> 1D wrapping
        float n = dot(i, step);
    
        vec3 u = f * f * (3.0 - 2.0 * f);
        return mix(mix(mix( hash(n + dot(step, vec3(0, 0, 0))), hash(n + dot(step, vec3(1, 0, 0))), u.x),
                       mix( hash(n + dot(step, vec3(0, 1, 0))), hash(n + dot(step, vec3(1, 1, 0))), u.x), u.y),
                   mix(mix( hash(n + dot(step, vec3(0, 0, 1))), hash(n + dot(step, vec3(1, 0, 1))), u.x),
                       mix( hash(n + dot(step, vec3(0, 1, 1))), hash(n + dot(step, vec3(1, 1, 1))), u.x), u.y), u.z);
    }
    mat3 m3 = mat3( 0.00,  0.80,  0.60,
                  -0.80,  0.36, -0.48,
                  -0.60, -0.48,  0.64 );
    //See: https://www.shadertoy.com/view/XdfXRj
    float flow(in vec3 p, in float t)
    {
        float z=2.;
        float rz = 0.;
        vec3 bp = p;
        for (float i= 1.;i < 5.;i++ )
        {
            p += time*.1;
            rz+= (sin(noise(p+t*0.8)*6.)*0.5+0.5) /z;
            p = mix(bp,p,0.6);
            z *= 2.;
            p *= 2.01;
            p*= m3;
        }
        return rz;	
    }
    
    void main(void) {    
        vec3 color = vec3(0.2, 0.3, 1.0);
        float d = distance(nPosition, (vec3(0.0,-1.0,0.0)*1.5))/3.0;
        color = mix(color, vec3(0.0, 0.0, 0.6), d);
        vec3 wp = nPosition;
        wp.y+=time*0.1;
        float n = flow(wp*vec3(0.6, 3.5, 0.6)*6.0, time*0.05);
        float n2 = flow(wp*(vec3(1.0, 3.6, 1.0)*-6.), time*0.2);
        float n3 = flow(wp*(vec3(1.0, 3.6, 1.0)*-12.), time*0.5);
        n3= n3*n3*n3;
        n = smoothstep(0.49, 0.51, n - n2)+smoothstep(0.7, 0.8, n3);
    
        color = mix(color, vec3(1.), n);
    
        gl_FragColor = vec4(color, 1.0);	
    }`
    
        let waterShader = new BABYLON.ShaderMaterial("waterShader", scene, {
                vertex: "retroWater",
            fragment: "retroWater",
        },{
            needAlphaBlending:false,
            attributes: ["position", "normal", "uv"],
            defines: [],
            samplers: ["textureSampler"],
            uniforms: ["world",	"worldView","worldViewProjection",
            "view",	"time",  "sunDirection"
            ]
        })
    
        water.material = waterShader
        water.material.emissiveColor = new BABYLON.Color3(0.01, 0.11, 0.17)
        water.visibility = 0.82
        water.time = 0
    
        water.material.emissiveFresnelParameters = new BABYLON.FresnelParameters();
        water.material.emissiveFresnelParameters.bias = 0.8;
        water.material.emissiveFresnelParameters.power = 6;
        water.material.emissiveFresnelParameters.leftColor = BABYLON.Color3.White();
        water.material.emissiveFresnelParameters.rightColor = BABYLON.Color3.Black();
    
        let ground = BABYLON.MeshBuilder.CreateIcoSphere('ground', {size:1, subdivisions:32}, scene)
        let vData = BABYLON.VertexData.ExtractFromMesh(ground)
        let p = vData.positions
        let noise = new ClassicalNoise();
        for(let i=0; i<p.length; i+=3){    
            let n =  0.9 + (Math.abs(noise.noise(p[i]*1.75,p[i+1]*1.75,p[i+2]*1.75))*0.42)
            let h = (new BABYLON.Vector3(vData.positions[i],vData.positions[i+1],vData.positions[i+2])).normalize().scale(n)
            p[i] = h.x
            p[i+1] = h.y
            p[i+2] = h.z
        }
        vData.positions = p
        vData.applyToMesh(ground)
    
        ground.material = new BABYLON.StandardMaterial('ground-Mat', scene)
        /*ground.material.emissiveColor = new BABYLON.Color3(0.02, 0.28, 0.55)
    
        ground.material.emissiveFresnelParameters = new BABYLON.FresnelParameters();
        ground.material.emissiveFresnelParameters.bias = 0.6;
        ground.material.emissiveFresnelParameters.power = 4;
        ground.material.emissiveFresnelParameters.leftColor = BABYLON.Color3.White();
        ground.material.emissiveFresnelParameters.rightColor = BABYLON.Color3.Black();*/
    
        ground.material.diffuseColor = new BABYLON.Color3(0.28, 0.6, 0.93)
        ground.material.diffuseFresnelParameters = new BABYLON.FresnelParameters();
        ground.material.diffuseFresnelParameters.bias = 0.8;
        ground.material.diffuseFresnelParameters.power = 12;
        ground.material.diffuseFresnelParameters.leftColor = BABYLON.Color3.White();
        ground.material.diffuseFresnelParameters.rightColor = new BABYLON.Color3(0.28, 0.6, 0.93)
    
        ground.material.specularPower = 256
    
        let atmos = BABYLON.MeshBuilder.CreateSphere('atmos', {diameter:2.25}, scene)
        atmos.material = new BABYLON.StandardMaterial('atmosMat', scene)    
        atmos.material.emissiveColor = new BABYLON.Color3(0.33, 0, 0.37)
    
        BABYLON.Effect.ShadersStore['atmosOpacityPixelShader'] = 
       `
        varying vec2 vUV;
        uniform float time;
    
    //	<https://www.shadertoy.com/view/4dS3Wd>
    //	By Morgan McGuire @morgan3d, http://graphicscodex.com
    //
    float hash(float n) { return fract(sin(n) * 1e4); }
    float hash(vec2 p) { return fract(1e4 * sin(17.0 * p.x + p.y * 0.1) * (0.1 + abs(sin(p.y * 13.0 + p.x)))); }
    
    float noise(float x) {
        float i = floor(x);
        float f = fract(x);
        float u = f * f * (3.0 - 2.0 * f);
        return mix(hash(i), hash(i + 1.0), u);
    }
    
    float noise(vec2 x) {
        vec2 i = floor(x);
        vec2 f = fract(x);
    
        // Four corners in 2D of a tile
        float a = hash(i);
        float b = hash(i + vec2(1.0, 0.0));
        float c = hash(i + vec2(0.0, 1.0));
        float d = hash(i + vec2(1.0, 1.0));
    
        // Simple 2D lerp using smoothstep envelope between the values.
        // return vec3(mix(mix(a, b, smoothstep(0.0, 1.0, f.x)),
        //			mix(c, d, smoothstep(0.0, 1.0, f.x)),
        //			smoothstep(0.0, 1.0, f.y)));
    
        // Same code, with the clamps in smoothstep and common subexpressions
        // optimized away.
        vec2 u = f * f * (3.0 - 2.0 * f);
        return mix(a, b, u.x) + (c - a) * u.y * (1.0 - u.x) + (d - b) * u.x * u.y;
    }
    
    // This one has non-ideal tiling properties that I'm still tuning
    float noise(vec3 x) {
        const vec3 step = vec3(110, 241, 171);
    
        vec3 i = floor(x);
        vec3 f = fract(x);
     
        // For performance, compute the base input to a 1D hash from the integer part of the argument and the 
        // incremental change to the 1D based on the 3D -> 1D wrapping
        float n = dot(i, step);
    
        vec3 u = f * f * (3.0 - 2.0 * f);
        return mix(mix(mix( hash(n + dot(step, vec3(0, 0, 0))), hash(n + dot(step, vec3(1, 0, 0))), u.x),
                       mix( hash(n + dot(step, vec3(0, 1, 0))), hash(n + dot(step, vec3(1, 1, 0))), u.x), u.y),
                   mix(mix( hash(n + dot(step, vec3(0, 0, 1))), hash(n + dot(step, vec3(1, 0, 1))), u.x),
                       mix( hash(n + dot(step, vec3(0, 1, 1))), hash(n + dot(step, vec3(1, 1, 1))), u.x), u.y), u.z);
    }
    mat3 m3 = mat3( 0.00,  0.80,  0.60,
                  -0.80,  0.36, -0.48,
                  -0.60, -0.48,  0.64 );
    //See: https://www.shadertoy.com/view/XdfXRj
    float flow(in vec3 p, in float t)
    {
        float z=2.;
        float rz = 0.;
        vec3 bp = p;
        for (float i= 1.;i < 5.;i++ )
        {
            p += time*.1;
            rz+= (sin(noise(p+t*0.8)*6.)*0.5+0.5) /z;
            p = mix(bp,p,0.6);
            z *= 2.;
            p *= 2.01;
            p*= m3;
        }
        return rz;	
    }
    
        void main(){
            float n = flow(vec3(vUV.xy*12.,time*0.0001), 0.);
            float n2 = flow(vec3(vUV.xy*24.,time*0.0002), 0.);
    
            n = smoothstep(0.65, 0.66, n-(n2*0.5));
            gl_FragColor = vec4(vec3(0.5,0.,0.5),n*0.25);
        }
        `
        let opacity = new BABYLON.CustomProceduralTexture('atmosOpacity',"atmosOpacity", 256, scene, false, false)
        atmos.material.opacityTexture = opacity
        atmos.material.opacityFresnelParameters = new BABYLON.FresnelParameters()
        atmos.material.opacityFresnelParameters.leftColor = BABYLON.Color3.White()
        atmos.material.opacityFresnelParameters.rightColor = BABYLON.Color3.Black()
        atmos.material.opacityFresnelParameters.bias = 0.6;
        atmos.material.opacityFresnelParameters.power = 2;
    
        ground.rotation.x = Math.PI*0.03
        atmos.rotation.x = Math.PI*0.03
    
        ground.rotation.z = Math.PI*0.035
        atmos.rotation.z = Math.PI*0.015
    
        water.parent = ground
        let up  = ground.up.clone()
        scene.onBeforeRenderObservable.add(()=>{
            water.time+=scene.getEngine().getDeltaTime()*0.001;
            waterShader.setFloat('time', water.time)
            opacity.setFloat('time', water.time*0.01)
            ground.rotate(up, Math.PI*0.005, BABYLON.Space.GLOBAL)
            atmos.rotate(up, Math.PI*0.002, BABYLON.Space.GLOBAL)
        })
    
    }
    
    let createSky = (scene)=>{
    var sky = BABYLON.MeshBuilder.CreateSphere("sphere", {diameter: sceneSize, segments: 32}, scene)
    
    BABYLON.Effect.ShadersStore["retroSkyVertexShader"] =
    `
    attribute vec3 position;
    attribute vec3 normal;
    attribute vec2 uv;
    uniform mat4 worldViewProjection;
    varying vec3 vPosition;
    varying vec3 nPosition;
    varying vec2 vUV;
    
    void main() {
        vec4 p = vec4( position, 1. );
        vPosition = p.xyz;
        nPosition = normalize(position.xyz);
        vUV = uv;
        gl_Position = worldViewProjection * p;
    }`;
    
    BABYLON.Effect.ShadersStore["retroSkyFragmentShader"] = 
    `
    #define PI        3.14159265
    #define HALFPI    1.57079633
    #define ROOTTHREE 1.73205081
    
    uniform float time;
    uniform vec3 sunDirection;
    varying vec3 vPosition;
    varying vec3 nPosition;
    varying vec2 vUV;
    
    //	<https://www.shadertoy.com/view/4dS3Wd>
    //	By Morgan McGuire @morgan3d, http://graphicscodex.com
    //
    float hash(float n) { return fract(sin(n) * 1e4); }
    float hash(vec2 p) { return fract(1e4 * sin(17.0 * p.x + p.y * 0.1) * (0.1 + abs(sin(p.y * 13.0 + p.x)))); }
    
    float noise(float x) {
        float i = floor(x);
        float f = fract(x);
        float u = f * f * (3.0 - 2.0 * f);
        return mix(hash(i), hash(i + 1.0), u);
    }
    
    float noise(vec2 x) {
        vec2 i = floor(x);
        vec2 f = fract(x);
    
        // Four corners in 2D of a tile
        float a = hash(i);
        float b = hash(i + vec2(1.0, 0.0));
        float c = hash(i + vec2(0.0, 1.0));
        float d = hash(i + vec2(1.0, 1.0));
    
        // Simple 2D lerp using smoothstep envelope between the values.
        // return vec3(mix(mix(a, b, smoothstep(0.0, 1.0, f.x)),
        //			mix(c, d, smoothstep(0.0, 1.0, f.x)),
        //			smoothstep(0.0, 1.0, f.y)));
    
        // Same code, with the clamps in smoothstep and common subexpressions
        // optimized away.
        vec2 u = f * f * (3.0 - 2.0 * f);
        return mix(a, b, u.x) + (c - a) * u.y * (1.0 - u.x) + (d - b) * u.x * u.y;
    }
    
    // This one has non-ideal tiling properties that I'm still tuning
    float noise(vec3 x) {
        const vec3 step = vec3(110, 241, 171);
    
        vec3 i = floor(x);
        vec3 f = fract(x);
     
        // For performance, compute the base input to a 1D hash from the integer part of the argument and the 
        // incremental change to the 1D based on the 3D -> 1D wrapping
        float n = dot(i, step);
    
        vec3 u = f * f * (3.0 - 2.0 * f);
        return mix(mix(mix( hash(n + dot(step, vec3(0, 0, 0))), hash(n + dot(step, vec3(1, 0, 0))), u.x),
                       mix( hash(n + dot(step, vec3(0, 1, 0))), hash(n + dot(step, vec3(1, 1, 0))), u.x), u.y),
                   mix(mix( hash(n + dot(step, vec3(0, 0, 1))), hash(n + dot(step, vec3(1, 0, 1))), u.x),
                       mix( hash(n + dot(step, vec3(0, 1, 1))), hash(n + dot(step, vec3(1, 1, 1))), u.x), u.y), u.z);
    }
    mat3 m3 = mat3( 0.00,  0.80,  0.60,
                  -0.80,  0.36, -0.48,
                  -0.60, -0.48,  0.64 );
    //See: https://www.shadertoy.com/view/XdfXRj
    float flow(in vec3 p, in float t)
    {
        float z=2.;
        float rz = 0.;
        vec3 bp = p;
        for (float i= 1.;i < 5.;i++ )
        {
            p += time*.1;
            rz+= (sin(noise(p+t*0.8)*6.)*0.5+0.5) /z;
            p = mix(bp,p,0.6);
            z *= 2.;
            p *= 2.01;
            p*= m3;
        }
        return rz;	
    }
    
    void main(void) {
        float h = nPosition.y*0.5+0.5;
        vec3 color = vec3(0.3, 0.1, 0.3);
        color = mix(color, vec3(.98, .1, .61)*0.2, smoothstep(0.0, 0.5, h));
        color = mix(color, vec3(.68, .1, .91)*0.2, smoothstep(0.5, 1.0, h));
        color = mix(color, vec3(.28, .2, .6), flow(nPosition*3., time*0.2)*0.5);
        color = mix(color, vec3(.18, .2, .1), flow((nPosition+vec3(1223.))*6., time*0.5)*0.2);
        color = mix(color, vec3(.6, .2, .1),  flow((nPosition+vec3(3123.))*6., time)*0.1);
        color = clamp(vec3(0.), vec3(1.), color);
        color*=0.3;    
        gl_FragColor = vec4(color, 1.0);	
    }`
    
        let shader = new BABYLON.ShaderMaterial("sky", scene, {
                vertex: "retroSky",
            fragment: "retroSky",
        },{
            needAlphaBlending:false,
            attributes: ["position", "normal", "uv"],
            defines: [],
            samplers: ["textureSampler"],
            uniforms: ["world",	"worldView","worldViewProjection",
            "view",	"time",  "sunDirection"
            ]
        })
    
        sky.material = shader
        sky.material.backFaceCulling = false
    
        sky.time = 0
    
        let starCube = BABYLON.MeshBuilder.CreateIcoSphere('starCube', {radius:1}, scene)
        let stars = new BABYLON.SolidParticleSystem("stars", scene);        
        stars.addShape(starCube, 2000)
        var starMesh = stars.buildMesh()
        starMesh.hasVertexAlpha = true
        starMesh.material = new BABYLON.StandardMaterial('starMeshMat', scene)
        starMesh.material.disableLighting = true
        starMesh.material.emissiveColor = BABYLON.Color3.White()
        stars.isAlwaysVisible = true
        starCube.dispose()
       
    
        stars.resetParicle = (particle)=>{
    
            let dir = BABYLON.Vector3.FromArray(randomSpherePoint(0,0,0,1))
            dir = dir.normalize()
            particle.position = dir.scale((sceneSize*0.5)-1);
            particle.rotation.x = Math.random() * Math.PI*2;
            particle.rotation.y = Math.random() * Math.PI*2;
            particle.rotation.z = Math.random() * Math.PI*2;
            let c0 = new BABYLON.Vector3(0,1,1)
            let c1 = new BABYLON.Vector3(1,0,0.5)
            let c2 = new BABYLON.Vector3(1,1,1)
            let c3 =  BABYLON.Vector3.Lerp(BABYLON.Vector3.Lerp(c0,c1, Math.random()), c2, Math.random()*0.5)       
            particle.color.r = c3.x*2
            particle.color.g = c3.y
            particle.color.b = c3.z*2
            
            let sr = (Math.random()*1.2)+0.3
            particle.scale = BABYLON.Vector3.FromArray([sr,sr,sr])
    
         
      };
    
        stars.initParticles = ()=>{
            for (var p = 0; p < stars.nbParticles; p++) {
                stars.resetParicle(stars.particles[p]);
            }
        }
    
        stars.updateParticle = (particle)=>{
            particle.rotation.x += particle.position.z / 100;
            particle.rotation.z += particle.position.x / 100;
        }
     
        stars.initParticles();
        stars.setParticles();
    
        scene.onBeforeRenderObservable.add(()=>{
            sky.time+=scene.getEngine().getDeltaTime()*0.0001;
            shader.setFloat('time', sky.time)
        })
    
    
    }
    
    let createVisualChain = (scene)=>{
        let glow = new BABYLON.GlowLayer("glow", scene);
        let downsample = new BABYLON.PassPostProcess("downsample", 0.0, scene.activeCamera, BABYLON.Texture.NEAREST_SAMPLINGMODE, scene.getEngine());
        let blurPass1 = new BABYLON.BlurPostProcess('glareBlurPass1', new BABYLON.Vector2(1, 0), 6, 1., scene.activeCamera, BABYLON.Texture.BILINEAR_SAMPLINGMODE,  scene.getEngine());
        let blurPass2 = new BABYLON.BlurPostProcess('glareBlurPass2', new BABYLON.Vector2(0, 1), 6, 1., scene.activeCamera, BABYLON.Texture.BILINEAR_SAMPLINGMODE,  scene.getEngine());
        let toneMap = new BABYLON.TonemapPostProcess("tonemap", BABYLON.TonemappingOperator.HejiDawson, 1.8, scene.activeCamera);
    
        return {glow, downsample, blurPass1, blurPass2, toneMap}
    }
    
    
    // Ported from Stefan Gustavson's java implementation
    // http://staffwww.itn.liu.se/~stegu/simplexnoise/simplexnoise.pdf
    // Read Stefan's excellent paper for details on how this code works.
    //
    // Sean McCullough banksean@gmail.com
    
    /**
     * You can pass in a random number generator object if you like.
     * It is assumed to have a random() method.
     */
    var ClassicalNoise = function(r) { // Classic Perlin noise in 3D, for comparison 
        if (r == undefined) r = Math;
      this.grad3 = [[1,1,0],[-1,1,0],[1,-1,0],[-1,-1,0], 
                                     [1,0,1],[-1,0,1],[1,0,-1],[-1,0,-1], 
                                     [0,1,1],[0,-1,1],[0,1,-1],[0,-1,-1]]; 
      this.p = [];
      for (var i=0; i<256; i++) {
          this.p[i] = Math.floor(r.random()*256);
      }
      // To remove the need for index wrapping, double the permutation table length 
      this.perm = []; 
      for(var i=0; i<512; i++) {
            this.perm[i]=this.p[i & 255];
      }
    };
    
    ClassicalNoise.prototype.dot = function(g, x, y, z) { 
        return g[0]*x + g[1]*y + g[2]*z; 
    };
    
    ClassicalNoise.prototype.mix = function(a, b, t) { 
        return (1.0-t)*a + t*b; 
    };
    
    ClassicalNoise.prototype.fade = function(t) { 
        return t*t*t*(t*(t*6.0-15.0)+10.0); 
    };
    
      // Classic Perlin noise, 3D version 
    ClassicalNoise.prototype.noise = function(x, y, z) { 
      // Find unit grid cell containing point 
      var X = Math.floor(x); 
      var Y = Math.floor(y); 
      var Z = Math.floor(z); 
      
      // Get relative xyz coordinates of point within that cell 
      x = x - X; 
      y = y - Y; 
      z = z - Z; 
      
      // Wrap the integer cells at 255 (smaller integer period can be introduced here) 
      X = X & 255; 
      Y = Y & 255; 
      Z = Z & 255;
      
      // Calculate a set of eight hashed gradient indices 
      var gi000 = this.perm[X+this.perm[Y+this.perm[Z]]] % 12; 
      var gi001 = this.perm[X+this.perm[Y+this.perm[Z+1]]] % 12; 
      var gi010 = this.perm[X+this.perm[Y+1+this.perm[Z]]] % 12; 
      var gi011 = this.perm[X+this.perm[Y+1+this.perm[Z+1]]] % 12; 
      var gi100 = this.perm[X+1+this.perm[Y+this.perm[Z]]] % 12; 
      var gi101 = this.perm[X+1+this.perm[Y+this.perm[Z+1]]] % 12; 
      var gi110 = this.perm[X+1+this.perm[Y+1+this.perm[Z]]] % 12; 
      var gi111 = this.perm[X+1+this.perm[Y+1+this.perm[Z+1]]] % 12; 
      
      // The gradients of each corner are now: 
      // g000 = grad3[gi000]; 
      // g001 = grad3[gi001]; 
      // g010 = grad3[gi010]; 
      // g011 = grad3[gi011]; 
      // g100 = grad3[gi100]; 
      // g101 = grad3[gi101]; 
      // g110 = grad3[gi110]; 
      // g111 = grad3[gi111]; 
      // Calculate noise contributions from each of the eight corners 
      var n000= this.dot(this.grad3[gi000], x, y, z); 
      var n100= this.dot(this.grad3[gi100], x-1, y, z); 
      var n010= this.dot(this.grad3[gi010], x, y-1, z); 
      var n110= this.dot(this.grad3[gi110], x-1, y-1, z); 
      var n001= this.dot(this.grad3[gi001], x, y, z-1); 
      var n101= this.dot(this-.grad3[gi101], x-1, y, z-1); 
      var n011= this.dot(this.grad3[gi011], x, y-1, z-1); 
      var n111= this.dot(this.grad3[gi111], x-1, y-1, z-1); 
      // Compute the fade curve value for each of x, y, z 
      var u = this.fade(x); 
      var v = this.fade(y); 
      var w = this.fade(z); 
       // Interpolate along x the contributions from each of the corners 
      var nx00 = this.mix(n000, n100, u); 
      var nx01 = this.mix(n001, n101, u); 
      var nx10 = this.mix(n010, n110, u); 
      var nx11 = this.mix(n011, n111, u); 
      // Interpolate the four results along y 
      var nxy0 = this.mix(nx00, nx10, v); 
      var nxy1 = this.mix(nx01, nx11, v); 
      // Interpolate the two last results along z 
      var nxyz = this.mix(nxy0, nxy1, w); 
    
      return nxyz; 
    };
    
    //https://stackoverflow.com/questions/5531827/random-point-on-a-given-sphere
    function randomSpherePoint(x0,y0,z0,radius){
        var u = Math.random();
        var v = Math.random();
        var theta = 2 * Math.PI * u;
        var phi = Math.acos(2 * v - 1);
        var x = x0 + (radius * Math.sin(phi) * Math.cos(theta));
        var y = y0 + (radius * Math.sin(phi) * Math.sin(theta));
        var z = z0 + (radius * Math.cos(phi));
        return [x,y,z];
    }

var engine;
try {
engine = createDefaultEngine();
} catch(e) {
console.log("the available createEngine function failed. Creating the default engine instead");
engine = createDefaultEngine();
}
    if (!engine) throw 'engine should not be null.';
    scene = createScene();;
    sceneToRender = scene

    engine.runRenderLoop(function () {
        if (sceneToRender) {
            sceneToRender.render();
        }
    });

    // Resize
    window.addEventListener("resize", function () {
        engine.resize();
    });

Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("ControlReady", []);
