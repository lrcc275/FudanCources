#include "Renderer.h"

#include "ArgParser.h"
#include "Camera.h"
#include "Image.h"
#include "Ray.h"
#include "VecUtils.h"

#include <limits>


Renderer::Renderer(const ArgParser &args) :
    _args(args),
    _scene(args.input_file)
{
}

void
Renderer::Render()
{
    int w = _args.width;
    int h = _args.height;

    Image image(w, h);
    Image nimage(w, h);
    Image dimage(w, h);

    // loop through all the pixels in the image
    // generate all the samples

    // This look generates camera rays and callse traceRay.
    // It also write to the color, normal, and depth images.
    // You should understand what this code does.
    Camera* cam = _scene.getCamera();
    for (int y = 0; y < h; ++y) {
        float ndcy = 2 * (y / (h - 1.0f)) - 1.0f;
        for (int x = 0; x < w; ++x) {
            float ndcx = 2 * (x / (w - 1.0f)) - 1.0f;
            // Use PerspectiveCamera to generate a ray.
            // You should understand what generateRay() does.
            Ray r = cam->generateRay(Vector2f(ndcx, ndcy));

            Hit h;
            Vector3f color = traceRay(r, cam->getTMin(), _args.bounces, h);

            image.setPixel(x, y, color);
            nimage.setPixel(x, y, (h.getNormal() + 1.0f) / 2.0f);
            float range = (_args.depth_max - _args.depth_min);
            if (range) {
                dimage.setPixel(x, y, Vector3f((h.t - _args.depth_min) / range));
            }
        }
    }
    // END SOLN

    // save the files 
    if (_args.output_file.size()) {
        image.savePNG(_args.output_file);
    }
    if (_args.depth_file.size()) {
        dimage.savePNG(_args.depth_file);
    }
    if (_args.normals_file.size()) {
        nimage.savePNG(_args.normals_file);
    }
}



Vector3f
Renderer::traceRay(const Ray &r,
    float tmin,
    int bounces,
    Hit &h) const
{
    // The starter code only implements basic drawing of sphere primitives.
    // You will implement phong shading, recursive ray tracing, and shadow rays.

    // TODO: IMPLEMENT 

    Vector3f TLight(0, 0, 0);
    TLight += _scene.getAmbientLight();
    for (int i = 0; i < _scene.lights.size(); i++)
        {
            Vector3f dirToLight;
            Vector3f lightIntensity;
            float distToLight;
            _scene.lights[i]->getIllumination(r.pointAtParameter(h.getT()),
                 dirToLight, lightIntensity, distToLight);
                
            if (_args.shadows)
            {
                Vector3f newOrigin = r.pointAtParameter(h.getT()) + 0.01 * dirToLight;
                Ray sRay(newOrigin, dirToLight);
                Hit sHit = Hit();
                Vector3f sTrace = traceRay(sRay, 0.0f, 0, sHit);
                bool isShadow = sHit.getT() < std::numeric_limits<float>::max();
                float newDist = (sRay.pointAtParameter(sHit.getT()) - newOrigin).abs();
                if (isShadow && newDist < distToLight)
                    continue;
            }
            TLight += h.getMaterial()->shade(r, h, dirToLight, lightIntensity);
        }
    return TLight;


    if (bounces > 0)
    {
        Vector3f D = r.getDirection();
        Vector3f N = h.getNormal().normalized();
        Vector3f R = (D - (2 * Vector3f::dot(D, N) * N)).normalized();
        Hit rHit = Hit();
        Ray rRay(r.pointAtParameter(h.getT()) + 0.005 * R, R);
        TLight += (h.getMaterial()->getSpecularColor()) * traceRay(rRay, 0.0f, bounces - 1, rHit);
    }



    if (_scene.getGroup()->intersect(r, tmin, h)) {
        return h.getMaterial()->getDiffuseColor();
    } else {
        return Vector3f(0, 0, 0);
    };
}



    int w = _args.width;
    int h = _args.height;

    Image image(w, h);
    Image nimage(w, h);
    Image dimage(w, h);

    int k = 1;
    if(_args.filter) k = 3;

    int kw = w * k;
    int kh = h * k;
    Image kimage(kh,kw);
    Image knimage(kh,kw);
    Image kdimage(kh,kw);
    // loop through all the pixels in the image
    // generate all the samples

    // This look generates camera rays and callse traceRay.
    // It also write to the color, normal, and depth images.
    // You should understand what this code does.
    Camera* cam = _scene.getCamera();
    for (int y = 0; y < kh; ++y) {
        float ndcy = 2 * (y / (kh - 1.0f)) - 1.0f;
        for (int x = 0; x < kw; ++x) {
            float ndcx = 2 * (x / (kw - 1.0f)) - 1.0f;
            Vector3f normal = Vector3f(0,0,0);
            Vector3f colors = Vector3f(0,0,0);
            float t = 0.0;
            if(_args.jitter){
                for(int i = 0;i != 16;i++){
                    srand(time(NULL));
                    double random_x = (double)rand() / RAND_MAX;
                    double random_y = (double)rand() / RAND_MAX;
                    random_x = ndcx + random_x * 2 / (kw - 1.0f);
                    random_y = ndcy + random_y * 2 / (kh - 1.0f);
                    Ray r1 = cam->generateRay(Vector2f(ndcx, ndcy));
                    Hit hit1;
                    colors += traceRay(r1, cam->getTMin(), _args.bounces, hit1);
                    normal += hit1.getNormal();
                    t += hit1.getT();
                }
                colors = colors / 16;
                normal = normal / 16;
                t = t / 16;
            }
            else{
                Ray r = cam->generateRay(Vector2f(ndcx, ndcy));
                Hit hit;
                colors = traceRay(r, cam->getTMin(), _args.bounces, hit);
                normal = hit.getNormal();
                t = hit.getT();
            }
            kimage.setPixel(x, y, colors);
            knimage.setPixel(x, y, (normal + 1.0f) / 2.0f);
            float range = (_args.depth_max - _args.depth_min);
            if (range) {
                kdimage.setPixel(x, y, Vector3f((t - _args.depth_min) / range));
            }

            // Use PerspectiveCamera to generate a ray.
            // You should understand what generateRay() does.
        }
    }

    if(k == 3){
        for (int y = 0; y < h; ++y) {
            for (int x = 0; x < w; ++x) {
                Vector3f color(0.0f, 0.0f, 0.0f);
                Vector3f normal(0.0f, 0.0f, 0.0f);
                Vector3f depth(0.0f, 0.0f, 0.0f);
                for (int j = -1; j <= 1; ++j) {
                    for (int i = -1; i <= 1; ++i) {
                        float weight = 1.0f;
                        if (abs(i) + abs(j) == 1) weight = 2.0f;  
                        else if (abs(i) + abs(j) == 0) weight = 4.0f;  
                        int neighbor_x = x * k + i + 1;
                        int neighbor_y = y * k + j + 1;   
                        color += kimage.getPixel(neighbor_x, neighbor_y) * weight;
                        normal += knimage.getPixel(neighbor_x, neighbor_y) * weight;
                        depth += kdimage.getPixel(neighbor_x, neighbor_y) * weight;
                }
            }
            image.setPixel(x, y, color / 16.0f); 
            nimage.setPixel(x, y, (normal /16.0f).normalized());  
            dimage.setPixel(x, y, depth / 16.0f);  
            }
        }
    }
    else{
        image = kimage;
        nimage = knimage;
        dimage = kdimage;
    }
    



