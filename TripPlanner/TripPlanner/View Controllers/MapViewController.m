//
//  MapViewController.m
//  TripPlanner
//
//  Created by user928728 on 7/14/21.
//

#import "MapViewController.h"
#import <MapKit/MapKit.h>
#import "Stage.h"
#import "Poi+MapAnnotation.h"
#import "StageDetailsTableViewController.h"

@interface MapViewController () <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

- (void) centerMapToLocation:(CLLocationCoordinate2D)location zoom:(double)zoom;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //GeoStage *g = (GeoStage *) self.stages.firstObject;
    NSLog(@"%s: Ci sono %lu stage nella mappa.", __FUNCTION__, (unsigned long)self.pois.count);
    
    //per dire che i metodi del protocollo siano implementati in questa classe
    self.mapView.delegate = self;
    
    //[self centerMapToLocation:CLLocationCoordinate2DMake(44.801700, 10.328012) zoom:0.1];
    
    [self.pois enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if([obj isKindOfClass:[Poi class]]){
            Poi *poi = (Poi *)obj;
            poi.sequenceValue = [NSNumber numberWithLong:(idx+1)];
            [self.mapView addAnnotation:poi];
        }
    }];
}

- (void) centerMapToLocation:(CLLocationCoordinate2D)location zoom:(double)zoom{
    MKCoordinateRegion mapRegion;
    mapRegion.center = location;
    mapRegion.span.latitudeDelta = zoom;
    mapRegion.span.longitudeDelta = zoom;
    [self.mapView setRegion:mapRegion];
}

//restituisce una MKAnnotationView collegata ad una certa annotazione fornita come argomento
- (MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    static NSString *AnnotationIdentifier = @"MapAnnotationView";
    
    MKAnnotationView *view = [mapView dequeueReusableAnnotationViewWithIdentifier:AnnotationIdentifier];
    
    if(!view){
        view = [[MKMarkerAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:AnnotationIdentifier];
        view.canShowCallout = YES;
        ((MKMarkerAnnotationView*)view).glyphText = annotation.description;
    }
    
    view.annotation = annotation;
    /*
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 36, 36)];
    imageView.image = [UIImage imageNamed:@"userinfo"];
    view.leftCalloutAccessoryView = imageView;
    view.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeInfoDark];
    */
    return view;
}

/*
//scarico l'immagine solo se l'utente interagisce con il pin toccandolo
- (void) mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view{
    if([view.leftCalloutAccessoryView isKindOfClass:[UIImageView class]]){
        UIImageView *imageView = (UIImageView *)view.leftCalloutAccessoryView;
        id<MKAnnotation> annotation = view.annotation;
        if([annotation isKindOfClass:[GeoStage class]]){
            GeoStage *gs = (GeoStage *)annotation;
            if(gs.thumbnail != nil){ //thumbnail è la property che contiene il link al sito con le immagini (metterlo a GeoStage)
                dispatch_queue_t queue = dispatch_queue_create("imageDownload", NULL);
                dispatch_async(queue, ^{
                    //gestire il download con una NSURLSession per non usare una chiamata bloccante come qui:
                    NSURL *url = [NSURL URLWithString:gs.thumbnail];
                    NSData *data = [NSData dataWithContentsOfURL:url];
                    UIImage *image = [UIImage imageWithData:data];
                    
                    //torno sulla coda principale
                    dispatch_queue_t mainQueue = dispatch_get_main_queue();
                    dispatch_async(mainQueue, ^{ imageView.image = image;
                    });
                });
            }
        }
    }
}
*/

//eseguito tutte le volte che faccio qualche operazione su un elemento attivo del mio callout (es. simbolo info)
- (void) mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control{
    if([control isEqual:view.rightCalloutAccessoryView]){
        [self performSegueWithIdentifier:@"ShowStageFromMap" sender:view];
    }
}

/*
#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"ShowStageFromMap"]){
        if([segue.destinationViewController isKindOfClass:[StageDetailsTableViewController class]]){
            StageDetailsTableViewController *vc = (StageDetailsTableViewController *)segue.destinationViewController;
            if([sender isKindOfClass:[MKAnnotationView class]]){
                MKAnnotationView *view = (MKAnnotationView *)sender;
                id<MKAnnotation> annotation = view.annotation;
                if([annotation isKindOfClass:[Stage class]]){
                    Stage *s = (Stage *)annotation;
                    vc.stageList = s;
                }
            }
        }
    }
}
*/

@end
